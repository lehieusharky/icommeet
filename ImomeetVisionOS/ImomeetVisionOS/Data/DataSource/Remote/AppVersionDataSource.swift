//
//  AppVersionDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol AppVersionDataSource {
    func checkAppVersion(_ request: CheckAppVersionRequest) async throws -> Result<CheckAppVersionModel?, XpertError>

}

class AppVersionDataSourceAPIImpl: AppVersionDataSource {
    
    func checkAppVersion(_ request: CheckAppVersionRequest) async throws -> Result<CheckAppVersionModel?, XpertError> {
        let checkAppVersionPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: checkAppVersionPath) else {
            return .failure(XpertError(.error_100))
        }

        let mulDict: [String: Any] = [
            "x": request.x,
            "name": request.name,
            "lang": request.lang,
            "ver_major": request.verMajor,
            "ver_minor": request.verMinor,
            "ver_build": request.verBuild,
            "accessToken" : request.accessToken,
        ]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: mulDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let checkAppVersionData = try? decoder.decode(CheckAppVersionModel.self, from: data)
                return .success(checkAppVersionData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
}

