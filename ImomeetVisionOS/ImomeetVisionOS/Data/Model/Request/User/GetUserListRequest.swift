//
//  GetUserListRequest.swift
//  ImomeetVision
//
//  Created by Thien Vu on 07/10/2023.
//

import Foundation

class GetUserListRequest {
    var x : String
    var from : String?
    var nReturn : String?
    var search : String?
    var filterNoEmail : String?
    var accessToken: String?
    
    init(x: String,
         from: String,
         nReturn: String,
         search: String,
         filterNoEmail: String,
         accessToken: String) {
        self.x = x
        self.from = from
        self.nReturn = nReturn
        self.search = search
        self.filterNoEmail = filterNoEmail
        self.accessToken = accessToken
    }

    var toDict: [String: Any] {
        let mulDict: [String: Any] = [
            "x": request.x,
            "from": request.from,
            "n_return": request.nReturn,
            "search": request.search,
            "filter_no_email": request.filterNoEmail,
            "accessToken" : request.accessToken,
        ]
        
        return mulDict
    }

    
}
