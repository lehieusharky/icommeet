//
//  TranslationDataSource.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

protocol TranslationDataSource {
    func inputTranslation(_ request: InputTranslationRequest) async throws -> Result<InputTranslationModel?, XpertError>

}

class TranslationDataSourceAPIImpl: TranslationDataSource {
    func inputTranslation(_ request: InputTranslationRequest) async throws -> Result<InputTranslationModel?, XpertError> {
        let inputTranslationPath = NetworkConstant.defautlWebServer + "/service/syncx.php";
        guard let url = URL(string: inputTranslationPath) else {
            return .failure(XpertError(.error_100))
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: request.toDict, options: [])

            let response: Result<Data, Error> = try await withCheckedThrowingContinuation { continuation in
                CommonAPI.requestAPI(url, parameters: data) { results in
                    continuation.resume(returning: results)
                }
            }
            
            switch response {
            case .success(let data):
                let decoder = JSONDecoder()
                let inputTranslationData = try? decoder.decode(InputTranslationModel.self, from: data)
                return .success(inputTranslationData)
            case .failure(let failure):
                return .failure(XpertError(500, description: failure.localizedDescription))
            }
        } catch {
            return .failure(XpertError(.error_100))
        }
    }
}
