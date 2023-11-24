//
//  Data+Ext.swift
//  ImomeetVision
//
//  Created by Thien Vu on 04/10/2023.
//

import Foundation
import CommonCrypto

extension String {
    func encodeASE(key: String) -> String? {
        if let keyData = key.data(using: .utf8), let passwordData = self.data(using: .utf8) {
            var encryptedData = Data(count: passwordData.count + kCCBlockSizeAES128)
            let ivData = Data(count: kCCBlockSizeAES128)
            
            let keyLength = size_t(kCCKeySizeAES256)
            let options = CCOptions(kCCOptionPKCS7Padding)
            
            let encryptedLength = encryptedData.count
            
            var numBytesEncrypted: size_t = 0
            
            let _ = encryptedData.withUnsafeMutableBytes { encryptedBytes in
                ivData.withUnsafeBytes { ivBytes in
                    passwordData.withUnsafeBytes { dataBytes in
                        keyData.withUnsafeBytes { keyBytes in
                            CCCrypt(
                                CCOperation(kCCEncrypt),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress,
                                keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress,
                                size_t(dataBytes.count),
                                encryptedBytes.baseAddress,
                                encryptedLength,
                                &numBytesEncrypted
                            )
                        }
                    }
                }
            }
            
            if numBytesEncrypted > 0 {
                encryptedData.count = numBytesEncrypted
                return encryptedData.base64EncodedString()
            } else {
                print("Encryption failed")
            }
        }
        
        return nil
        
    }
    
    func decodeASE(key: String) -> String? {
        if let keyData = key.data(using: .utf8), let encryptedData = Data(base64Encoded: self) {
            var decryptedData = Data(count: encryptedData.count)
            let ivData = Data(count: kCCBlockSizeAES128)
            
            let keyLength = size_t(kCCKeySizeAES256)
            let options = CCOptions(kCCOptionPKCS7Padding)
            
            let decryptedLength = decryptedData.count
            
            var numBytesDecrypted: size_t = 0
            
            let _ = encryptedData.withUnsafeBytes { encryptedBytes in
                ivData.withUnsafeBytes { ivBytes in
                    decryptedData.withUnsafeMutableBytes { decryptedBytes in
                        keyData.withUnsafeBytes { keyBytes in
                            CCCrypt(
                                CCOperation(kCCDecrypt),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress,
                                keyLength,
                                ivBytes.baseAddress,
                                encryptedBytes.baseAddress,
                                size_t(encryptedBytes.count),
                                decryptedBytes.baseAddress,
                                decryptedLength,
                                &numBytesDecrypted
                            )
                        }
                    }
                }
            }
            
            if numBytesDecrypted > 0 {
                decryptedData.count = numBytesDecrypted
                if let decryptedString = String(data: decryptedData, encoding: .utf8) {
                    return decryptedString
                } else {
                    print("Decryption failed: Unable to convert data to string")
                }
            } else {
                print("Decryption failed")
            }
        }
        return nil
    }
}
