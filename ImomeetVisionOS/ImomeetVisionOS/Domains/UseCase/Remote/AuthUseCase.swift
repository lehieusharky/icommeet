//
//  LoginUseCase.swift
//  ImomeetVision
//
//  Created by Thien Vu on 08/10/2023.
//

import Foundation

class AuthUseCase {
    private(set) var repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func loginWith(_ loginEntity: LoginRequest) async throws -> LoginEntity {
        do {
            let results = try await repository.loginWith(loginEntity)
            
            switch results {
            case .success(let success):
                cacheUserInfo(user: loginEntity.userId, pasword: loginEntity.pass)
                
                let entity = LoginEntity(success)
                
                if let jwt = try entity.parseJWT(loginEntity.getVerifyCodeSF()) {
                    handleLoginSuccess(jwt)
                    NotificationCenter.default.post(name: .userLoginSuccessNotification, object: nil)
                    
                    return entity
                }
                
                return LoginEntity(XpertError(.error_100))
            case .failure(let failure):
                return LoginEntity(failure)
            }
        } catch {
            LogSF.LogError("\(error)")
            return LoginEntity(XpertError(error.localizedDescription))
        }
    }
    
    func logout(_ logoutEntity: LogoutRequest, completion: @escaping (LogoutEntity) -> Void) {
        repository.logout(logoutEntity) { results in
            switch results {
            case .success(let success):
                completion(LogoutEntity(success))
            case .failure(let failure):
                completion(LogoutEntity(failure))
            }
        }
    }
    
}

extension AuthUseCase {
    
    private func cacheUserInfo(user: String, pasword: String) {
        guard !user.isEmpty && !pasword.isEmpty else {
            return
        }
        
        SFCacheDefault.shared.saveUsername(user)
        SFCacheDefault.shared.savePassword(pasword)
    }
    
    private func handleLoginSuccess(_ dict: [String: Any]) {
        SFCacheDefault.shared.setValue("1", forKey: Constants.needUpdateDataBase)
        
        saveACLModel(dict)
        saveForceSip(dict)
        cacheAccessToken(dict)
        chatServer(dict)
        saveProfile(dict)
        sessionCapcha()
        saveServerInfo(dict)
        savePcfHost(dict)
        checkSipInfo(dict)
        saveCommonInfo(dict)
        saveVmeetID(dict)
    }
}

//MARK: - Save login info
extension AuthUseCase {
    private func cacheAccessToken(_ dict: [String: Any]) {
        guard let accessToken = dict["access_token"] as? String,
              !accessToken.isEmpty else {
            return
        }
        
        SFCacheDefault.shared.saveAccessToken(accessToken)
    }
    
    private func saveACLModel(_ dict: [String: Any]) {
        var userAcl = UserACLModel()
        
        if let isUserAcl = dict["user_acl"] as? [String: Any] {
            userAcl = UserACLModel(dict: isUserAcl) // - UserACLModel(dict: dict)
        }
        SFCacheDefault.shared.setObject(object: userAcl, forKey: Constants.userACL)
    }
    
    private func saveForceSip(_ dict: [String: Any]) {
        guard let systemExt = dict["system_ext"] as? String,
              let data = systemExt.data(using: .utf8),
              let dicSystemExt = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
              let forceSips = dicSystemExt["force_sips"] as? String else {
            SFCacheDefault.shared.setValue(false, forKey: Constants.networkOverTLS)
            return
        }
        
        SFCacheDefault.shared.setValue(forceSips == "1" ? true : false, forKey: Constants.networkOverTLS)
    }
    
    private func chatServer(_ dict: [String: Any]) {
        guard let sfChat = dict["chat_server"] as? String else {
            return
        }
        
        NetworkUseCase.shared.saveXMPPServer(sfChat)
    }
    
    private func saveProfile(_ dict: [String: Any]) {
        if let usernameSaveDB = dict["vmeet_id"] as? String,
           let storedNetworkString = NetworkUseCase.shared.getNetworkWebServer(),
            let url = URL(string: storedNetworkString) {

            let serverHost = url.host?.trimmingCharacters(in: .whitespacesAndNewlines)
            if let serverHost = serverHost {
                let profile = "\(usernameSaveDB)@\(serverHost)"
                
                //TODO: - THIEN VU will implement later
//                NgnEngine.getInstance().profileService.addProfile(profile)
//                NgnEngine.getInstance().setProfile(profile)
                
                SFCacheDefault.shared.setValue(profile, forKey: Constants.profileAfterKilled)
            }
        }
    }
    
    private func sessionCapcha() {
        let failTry = 0;
        SFCacheDefault.shared.setValue(failTry, forKey: Constants.failtryImomeet)
        
        //TODO: - THIEN VU will implement later
//        [self resetSessionForCaptcha];
    }
    
    private func saveServerInfo(_ dict: [String: Any]) {
        
        if let stunServer = dict["stun_servers"] as? String {
            NetworkUseCase.shared.sfStunServer = stunServer
        }
        
        if let ntpServer = dict["ntp_server"] as? String {
            NetworkUseCase.shared.sfNTPServer = ntpServer
        }
        
        if let turnServer = dict["turn_servers"] as? String {
            NetworkUseCase.shared.sfTurnServer = turnServer
        }
        
        if let sipServer = dict["sip_svr"] as? String {
            NetworkUseCase.shared.currentSipServer = sipServer
            NetworkUseCase.shared.sfSipServer = sipServer
        }
        
        if let sipServer2 = dict["sip_svr2"] as? String {
            let currentServerPart = sipServer2.components(separatedBy: ":")

            guard currentServerPart.count > 1 else {
                return
            }
            
            let sipServerPart = currentServerPart.first
            let port: Int = Int(currentServerPart[1]) ?? -1
            
            NetworkUseCase.shared.currentSipServer = sipServerPart ?? ""
            if port != -1 {
                SFCacheDefault.shared.setValue(port, forKey: Constants.networkPCSCFPort)
            }
        }
    }
    
    func savePcfHost(_ dict: [String: Any]) {
        
        guard let proxyServer = dict["sip_proxy"] as? String,
              !proxyServer.isEmpty else {
            return
        }
        
        let currentServerParts = proxyServer.components(separatedBy: ";")
        let index = Int(arc4random_uniform(UInt32(currentServerParts.count)))
        var currentServerPart = !currentServerParts.isEmpty ? currentServerParts[0] : ""
        
        if currentServerParts.count > index {
            currentServerPart = currentServerParts[index]
        }
        
        var port = NetworkConstant.defaultPCSCFPort
        let serverPort = currentServerPart.components(separatedBy: ":")
        if let server = serverPort.first {
            if serverPort.count > 1, 
               let portValue = Int(serverPort[1]) {
                port = portValue
            }
            
            NetworkUseCase.shared.savePCSCFInfo(server: server, port: port)
        }
    }
    
    func checkSipInfo(_ dict: [String: Any]) {
        
        if let sipOverTLS = dict["sip_proxy_tls"] as? String,
           !sipOverTLS.isEmpty {
            NetworkUseCase.shared.saveSipOverTls(sipOverTLS)
        }

        if let identityPasswordMD5 = dict["token"] as? String {
            NetworkUseCase.shared.savePasswordMD5(identityPasswordMD5)
        }

        if let identityImpi = dict["vmeet_id"] as? String {
            NetworkUseCase.shared.saveIdentityImpi(identityImpi)
        }
        
        NetworkUseCase.shared.saveIdentityPassword(true)

        if let apiVersion = dict["api_ver"] as? String {
            NetworkUseCase.shared.saveAPIIdentityVersion(apiVersion)
        }

        if let webServer = dict["web_server"] as? String, !webServer.isEmpty {
            NetworkUseCase.shared.saveWebServer(webServer)
        }

        if let xpertWorkServer = dict["xpert_work_server"] as? String, 
           !xpertWorkServer.isEmpty {
            NetworkUseCase.shared.saveXperWorkServer(xpertWorkServer)
        } else {
            NetworkUseCase.shared.saveXperWorkServer("")
        }
        
        NetworkUseCase.shared.saveNetworkRealm(NetworkUseCase.shared.currentSipServer)
    }
    
    func saveCommonInfo(_ dict: [String: Any]) {
        
        SFCacheDefault.shared.setValue(true, forKey: Constants.autoLoginFlag)
        
        if let network = NetworkUseCase.shared.getNetworkWebServer() {
            SFCacheDefault.shared.setValue(network, forKey: Constants.webserAutoLogin)
        }

        // Hide captcha
//        self.hideCaptchaWithOutAnitationAndClearData()

        // Reset failtry
//        self.resetFailtry()
        
        SFCacheDefault.shared.setRuntimeValue(true, forKey: Constants.isLogin)

        if let userExpiryTime = dict["user_expiry_time"] as? Int,
           userExpiryTime <= 7 {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let today = dateFormatter.string(from: Date())

            if let timeEndExpire = UserDefaults.standard.string(forKey: "TimeEndExpire"), 
                timeEndExpire == today {
                SFCacheDefault.shared.setValue(false, forKey: Constants.isTimeExpire)
            } else {
                SFCacheDefault.shared.setValue(true, forKey: Constants.isTimeExpire)
            }

            SFCacheDefault.shared.setValue(userExpiryTime, forKey: Constants.userExpireTime)
        } else {
            SFCacheDefault.shared.removeValueFor(key: Constants.timeEndExpire)
            SFCacheDefault.shared.removeValueFor(key: Constants.isTimeExpire)
            SFCacheDefault.shared.removeValueFor(key: Constants.userExpireTime)
        }
        
        NetworkUseCase.shared.saveWebUrl()
    }
    
    func saveVmeetID(_ dict: [String: Any]) {
        guard let vmeetID = dict["vmeet_id"] as? String else {
            return
        }
        SFCacheDefault.shared.setValue(vmeetID, forKey: Constants.identityImpi)
    }
}
