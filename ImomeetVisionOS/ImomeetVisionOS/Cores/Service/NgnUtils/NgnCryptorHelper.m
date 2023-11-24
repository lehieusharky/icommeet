//
//  NgnCryptorHelper.m
//  ios-ngn-stack
//
//  Created by Wu Hailong on 15/3/9.
//  Copyright (c) 2015年 Softfoundry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NgnStringUtils.h"
#import "NgnCryptorHelper.h"

@implementation NgnCryptorHelper

+ (NSString *) encrypt:(NSString *) str key:(NSString *)key IV:(NSString *)iv
{
	return [NgnCryptorHelper doCipher:str key:key IV:iv context:kCCEncrypt];
}
+ (NSString *) decrypt:(NSString*) str key:(NSString *)key IV:(NSString *)iv
{
	return [NgnCryptorHelper doCipher:str key:key IV: iv context:kCCDecrypt];
}

+ (NSString *)doCipher:(NSString *)sTextIn key:(NSString *)sKey IV:(NSString*) iv
			   context:(CCOperation)encryptOrDecrypt {
	
	NSData * dTextIn;
	if (encryptOrDecrypt == kCCDecrypt) {
		dTextIn = [NgnStringUtils base64Decoding:sTextIn] ;
	}
	else{
		dTextIn = [sTextIn dataUsingEncoding: NSUTF8StringEncoding];
	}
	
	NSData* dKey = [sKey dataUsingEncoding: NSASCIIStringEncoding];
	NSData* dIV = [iv dataUsingEncoding:NSASCIIStringEncoding];
	
	uint8_t *bufferPtr1 = NULL;
	size_t bufferPtrSize1 = 0;
	size_t movedBytes1 = 0;

	//bufferPtrSize1 = ([sTextIn length] + kCCKeySizeDES) & ~(kCCKeySizeDES -1);
    bufferPtrSize1 = ([sTextIn length] + kCCKeySizeDES) *2;
	bufferPtr1 = malloc(bufferPtrSize1 * sizeof(uint8_t));
	memset((void *)bufferPtr1, 0x00, bufferPtrSize1);
	CCCryptorStatus status = CCCrypt(encryptOrDecrypt, // CCOperation op
			kCCAlgorithmDES, // CCAlgorithm alg
			kCCOptionPKCS7Padding, // CCOptions options
			[dKey bytes], // const void *key
			[dKey length], // size_t keyLength
			[dIV bytes], // const void *iv
			[dTextIn bytes], // const void *dataIn
			[dTextIn length],  // size_t dataInLength
			(void *)bufferPtr1, // void *dataOut
			bufferPtrSize1,     // size_t dataOutAvailable
			&movedBytes1);      // size_t *dataOutMoved
	
	//print this return value
//    NSLog(@"CCCryptorStatus: %d",status);
	NSString * sResult;
	if (encryptOrDecrypt == kCCDecrypt){
		sResult = [[ NSString alloc] initWithData:[NSData dataWithBytes:bufferPtr1
																  length:movedBytes1] encoding:NSUTF8StringEncoding];
	}
	else {
		NSData *dResult = [NSData dataWithBytes:bufferPtr1 length:movedBytes1];
		sResult = [NgnStringUtils base64Encoding:dResult];
	}
	free(bufferPtr1);
	
	return sResult;
}

@end
