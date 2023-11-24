//
//  NetworkService.swift
//  ImomeetVisionOS
//
//  Created by Thien Vu on 28/10/2023.
//

import Foundation

class NetworkUseCase {
    
    static let shared = NetworkUseCase()
    
    public var sfStunServer: String
    public var sfNTPServer: String
    public var sfTurnServer: String
    public var sfSipServer: String
    
    public var currentSipServer: String
    
    public var currentSipProxyServer: String
    public var currentSipProxyPort: Int
    
    private var networkURL: String = ""
    
    private init() {
        self.sfStunServer = ""
        self.sfNTPServer = ""
        self.sfTurnServer = ""
        self.sfSipServer = ""
        self.currentSipServer = ""
        self.currentSipProxyServer = ""
        self.currentSipProxyPort = 0
    }
    
    func savePCSCFInfo(server: String, port: Int) {
        currentSipProxyServer = server
        currentSipProxyPort = port
        
        SFCacheDefault.shared.setValue(server, forKey: Constants.networkPCSCF)
        SFCacheDefault.shared.setValue(port, forKey: Constants.networkPCSCFPort)
    }
    
    func saveWebUrl() {
        var ret: String

        if let webServer = getWebServer(),
            !webServer.isEmpty {
            ret = webServer
        } else if let networkServer = getNetworkWebServer(), !networkServer.isEmpty {
            ret = networkServer
        } else {
            ret = ""
            return
        }

        if !ret.lowercased().hasPrefix("http://") && !ret.lowercased().hasPrefix("https://") {
            ret = "http://\(ret)"
        }
        
        networkURL = ret
    }
    
    func getNetworkURL() -> String {
        return networkURL
    }
}

extension NetworkUseCase {
    //MARK: - NetworkWebServer
    func saveNetworkWebServer(_ network: String) {
        SFCacheDefault.shared.setRuntimeValue(network, forKey: Constants.networkWebService)
    }
    
    func getNetworkWebServer() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.networkWebService) as? String
    }
    
    func savePortNetwork(_ port: Int) {
        SFCacheDefault.shared.setRuntimeValue(port, forKey: Constants.networkWebServicePort)
    }
    
    func getPortNetwork() -> Int? {
        return SFCacheDefault.shared.getValuefor(key: Constants.networkWebServicePort) as? Int
    }
    
    //MARK: - Sip Over TLS Proxy
    func saveSipOverTls(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.sipOverTlsProxy)
    }
    
    func getSipOverTls() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.sipOverTlsProxy) as? String
    }
    
    //MARK: - Password MD5
    func savePasswordMD5(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.identityPasswordMD5)
    }
    
    func getPasswordMD5() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.identityPasswordMD5) as? String
    }
    
    //MARK: - Identity impi
    func saveIdentityImpi(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.identityImpiValue)
    }
    
    func getIdentityImpi() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.identityImpiValue) as? String
    }
    
    //MARK: - Remember identity password
    func saveIdentityPassword(_ value: Bool) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.rememberIdentity)
    }
    
    func getIdentityPassword() -> Bool? {
        return SFCacheDefault.shared.getValuefor(key: Constants.rememberIdentity) as? Bool
    }
    
    //MARK: - Identity API version
    func saveAPIIdentityVersion(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.identityAPIVersion)
    }
    
    func getAPIIdentityVersion() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.identityAPIVersion) as? String
    }
    
    //MARK: - Xpert work server
    func saveXperWorkServer(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.xpertWorkServer)
    }
    
    func getXperWorkServer() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.xpertWorkServer) as? String
    }
    
    //MARK: - Network Server
    func saveWebServer(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.webServer)
    }
    
    func getWebServer() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.webServer) as? String
    }
    
    //MARK: - Network Realm
    func saveNetworkRealm(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.networkRealm)
    }
    
    func getNetworkRealm() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.networkRealm) as? String
    }
    //MARK: - Network XMPP
    func saveXMPPServer(_ value: String) {
        SFCacheDefault.shared.setRuntimeValue(value, forKey: Constants.xmppServer)
    }
    
    func getXMPPServer() -> String? {
        return SFCacheDefault.shared.getValuefor(key: Constants.xmppServer) as? String
    }
}
