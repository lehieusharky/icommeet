//
//  UtilConstants.swift
//  ImomeetVision
//
//  Created by Thien Vu on 30/09/2023.
//

import Foundation
import SwiftUI

class Constants {
    static let lightTheme = Themes(category: .light, type: "json")
    static let darkTheme = Themes(category: .dark, type: "json")
}

//MARK: - Window
extension Constants {
    static let loginView = "loginView"
}

//MARK: - Key Cache
extension Constants {
    static let networkAPIPath = "networkAPIPath"
    static let needUpdateDataBase = "needUpdateDatabase"
    static let userACL = "userACL"
    static let networkOverTLS = "NETWORK_SIP_OVER_TLS"
    static let networkXMPPServer = "NETWORK_XMPP_SERVER_STR"
    static let networkXMPPServerPort = "NETWORK_XMPP_SERVER_PORT"
    static let networkWebService = "NETWORK_WEBSERVER_LOGIN"
    static let networkWebServicePort = "NETWORK_WEBSERVICE_PORT"
    static let profileAfterKilled = "PROFILE_FOR_AFTER_KILLEDAPP"
    static let failtryImomeet = "failtryimomeet"
    static let identityImpi = "IDENTITY_IMPI_STR"
    static let autoLoginFlag = "AutoLoginFlagSG"
    static let usernameAutoLOgin = "Username_Default_AutoLogin"
    static let passwordAutoLOgin = "Password_Default_AutoLogin"
    static let webserAutoLogin = "WebServer_Default_AutoLogin"
    static let usernameDefaultText = "Username_Default_For_Textfield"
    static let isLogin = "isLogin"
    static let timeEndExpire = "TimeEndExpire"
    static let isTimeExpire = "is_expiry_time"
    static let userExpireTime = "user_expiry_time"
    static let networkPCSCF = "NETWORK_PCSCF_HOST"
    static let networkPCSCFPort = "NETWORK_PCSCF_PORT"
    static let sipOverTlsProxy = "SIP_OVER_TLS_PROXY_VALUE"
    static let identityPasswordMD5 = "IDENTITY_PASSWORD_MD5"
    static let identityImpiValue = "IDENTITY_IMPI"
    static let rememberIdentity = "REMEMBER_IDENTITY_PASSWORD"
    static let identityAPIVersion = "IDENTITY_API_VERSION"
    static let webServer = "WEB_SERVER"
    static let xpertWorkServer = "XPERT_WORK_SERVER"
    static let networkServer = "NETWORK_SERVER"
    static let networkRealm = "NETWORK_REALM"
    static let xmppServer = "XMPP_SERVER"
}
