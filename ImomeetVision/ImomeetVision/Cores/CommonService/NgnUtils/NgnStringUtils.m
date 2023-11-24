/* Copyright (C) 2010-2011, Mamadou Diop.
 * Copyright (c) 2011, Doubango Telecom. All rights reserved.
 *
 * Contact: Mamadou Diop <diopmamadou(at)doubango(dot)org>
 *
 * This file is part of iDoubs Project ( http://code.google.com/p/idoubs )
 *
 * idoubs is free software: you can redistribute it and/or modify it under the terms of
 * the GNU General Public License as published by the Free Software Foundation, either version 3
 * of the License, or (at your option) any later version.
 *
 * idoubs is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 */
#import "NgnStringUtils.h"
#import "NgnDateTimeUtils.h"
#import <CommonCrypto/CommonDigest.h>
#import "NgnCryptorHelper.h"

#undef kStringEmpty
#define kStringEmpty    @""

static char base64_encodingTable[64] = {
  'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P',
  'Q','R','S','T','U','V','W','X','Y','Z','a','b','c','d','e','f',
  'g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v',
  'w','x','y','z','0','1','2','3','4','5','6','7','8','9','+','/' };
@implementation NgnStringUtils

+(const NSString*)emptyValue{
  return kStringEmpty;
}

+(const NSString*)nullValue{
  return @"(null)";
}

+(BOOL)isNullOrEmpty:(NSString*)string{
  return string == nil || string==(id)[NSNull null] || [string isEqualToString: kStringEmpty];
}

+(BOOL)contains:(NSString*) string subString:(NSString*)subStr{
  return [string rangeOfString:subStr].location != NSNotFound;
}

+(BOOL)isContainOnlyNumber:(NSString *)string {
    NSString * regex        = @"(^[0-9]*$)";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:string];
    return isMatch;
}

+(BOOL)isContainSpecialString:(NSString *)string {
    NSString * regex        = @"(^[A-Za-z0-9 ]*$)";
    NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch            = [pred evaluateWithObject:string];
    return !isMatch;
}

+(NSString*) toNSString: (const char*)cstring{
  return cstring ? [NSString stringWithUTF8String:cstring] : nil;
}

+(const char*) toCString: (NSString*)nsstring{
  return [nsstring UTF8String];
}

+(NSString*) objectToNSString: (id)object
{
  if(object == nil || object == [NSNull null] ) return @"";
  if([object isKindOfClass:[NSString class]] ) return (NSString*)object;
  
  return [object description];
}

#if TARGET_OS_IPHONE
+(UIColor*) colorFromRGBValue: (int)rgbvalue
{
  return [UIColor colorWithRed: ((float)((rgbvalue & 0xFF0000) >> 16))/255.0
                         green: ((float)((rgbvalue & 0xFF00) >> 8))/255.0
                          blue: ((float)(rgbvalue & 0xFF))/255.0 alpha:1.0];
}
#endif

//David added
+ (NSString*)stringBetweenString:(NSString*)string startString:(NSString*)start andString:(NSString*)end {
  NSRange startRange = [string rangeOfString:start];
  if (startRange.location != NSNotFound) {
    NSRange targetRange;
    targetRange.location = startRange.location + startRange.length;
    targetRange.length = [string length] - targetRange.location;
    NSRange endRange = [string rangeOfString:end options:0 range:targetRange];
    if (endRange.location != NSNotFound) {
      targetRange.length = endRange.location - targetRange.location;
      return [string substringWithRange:targetRange];
    }
  }
  return nil;
}

+ (BOOL)isEmptyOrSpaceAndNewline:(NSString*)string{
  NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  NSString *trimmedString = [string stringByTrimmingCharactersInSet:charSet];
  if ([trimmedString isEqualToString:@""]) {
    // it's empty or contains only white spaces
    return YES;
  }
  return NO;
}
//End David added

+ (NSString *)generateUuidString
{
  // create a new UUID which you own
  CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
  
  // create a new CFStringRef (toll-free bridged to NSString)
  // that you own
  NSString *uuidString = (__bridge NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
  
  // transfer ownership of the string
  // to the autorelease pool
  uuidString = nil;
  
  // release the UUID
  CFRelease(uuid);
  
  return uuidString;
}

+(NSString *) genRandStringLength: (int) len
{
  //create name
  NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
  NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
  
  for (int i=0; i<len; i++) {
    [randomString appendFormat: @"%c", [letters characterAtIndex: rand()%[letters length]]];
  }
  
  return randomString;
}


+ (NSString *) urlEncodedString: (NSString*)input
{
  NSString *resultStr = input;
  
CFStringRef originalString = (__bridge CFStringRef) input;
  CFStringRef leaveUnescaped = CFSTR(" ");
  CFStringRef forceEscaped = CFSTR("!*'();:@&=+$,/?%#[]");
  
  CFStringRef escapedStr;
  escapedStr = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                       originalString,
                                                       leaveUnescaped,
                                                       forceEscaped,
                                                       kCFStringEncodingUTF8);
  
  if( escapedStr )
  {
    NSMutableString *mutableStr = [NSMutableString stringWithString:(__bridge NSString *)escapedStr];
    CFRelease(escapedStr);
    
    // replace spaces with plusses
    [mutableStr replaceOccurrencesOfString:@" "
                                withString:@"%20"
                                   options:0
                                     range:NSMakeRange(0, [mutableStr length])];
    resultStr = mutableStr;
  }
  return resultStr;
}

+ (NSString*) hexString: (NSData*) input
{
  NSInteger len = [input length];
  NSMutableString *output = [NSMutableString stringWithCapacity:len * 2];
  
  const unsigned char *cStr = [input bytes];
  for(int i = 0; i < len; i++)
    [output appendFormat:@"%02x", cStr[i]];
  
  return  output;
}

+ (NSString*) md5 : (NSString*)input
{
  if( input == nil ) return @"";
  const char *cStr = [input UTF8String];
  unsigned char digest[CC_MD5_DIGEST_LENGTH];
  CC_MD5( cStr, (unsigned int)strlen(cStr), digest ); // This is the md5 call
  
  NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
  
  for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];
  
  return  output;
}

+ (NSString*) sha1:(NSString*)input
{
  if( input == nil ) return @"";
  const char *cStr = [input UTF8String];
  
  uint8_t digest[CC_SHA1_DIGEST_LENGTH];
  
  CC_SHA1(cStr, (unsigned int)strlen(cStr), digest);
  
  NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
  
  for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
    [output appendFormat:@"%02x", digest[i]];
  
  return output;
  
}

+ (NSString*) oddString:(NSString*)input
{
  NSString* strRet = @"";
  for(int i = 0; i < [input length]; i+=2) {
    strRet = [strRet stringByAppendingString:[input substringWithRange: NSMakeRange(i,1)]];
  }
  return  strRet;
}

+ (NSString *) getTelephoneArea: (NSString*)countryCode
{
  return NSLocalizedStringFromTable(countryCode, @"countrycode", nil);
}

+ (NSString *) getAgentString: (NSString*)stringCode
{
  NSString* ret = NSLocalizedStringFromTable(stringCode, @"agent", nil);
  if( ret == nil ) {
    ret = NSLocalizedString(stringCode, nil);
  }
  return ret;
}


+ (NSString *) base64Encoding: (NSData*) data
{
  return [self base64EncodingWithLineLength: data lineLength: 0];
}

+ (NSString *) base64EncodingWithLineLength:(NSData*) data lineLength: (unsigned int) lineLength
{
  const unsigned char     *bytes = [data bytes];
  NSMutableString *result = [NSMutableString stringWithCapacity:[data length]];
  unsigned long ixtext = 0;
  unsigned long lentext = [data length];
  long ctremaining = 0;
  unsigned char inbuf[3], outbuf[4];
  unsigned short i = 0;
  unsigned short charsonline = 0, ctcopy = 0;
  unsigned long ix = 0;
  
  while( YES ) {
    ctremaining = lentext - ixtext;
    if( ctremaining <= 0 ) break;
    
    for( i = 0; i < 3; i++ ) {
      ix = ixtext + i;
      if( ix < lentext ) inbuf[i] = bytes[ix];
      else inbuf [i] = 0;
    }
    
    outbuf [0] = (inbuf [0] & 0xFC) >> 2;
    outbuf [1] = ((inbuf [0] & 0x03) << 4) | ((inbuf [1] & 0xF0) >> 4);
    outbuf [2] = ((inbuf [1] & 0x0F) << 2) | ((inbuf [2] & 0xC0) >> 6);
    outbuf [3] = inbuf [2] & 0x3F;
    ctcopy = 4;
    
    switch( ctremaining ) {
      case 1:
        ctcopy = 2;
        break;
      case 2:
        ctcopy = 3;
        break;
    }
    
    for( i = 0; i < ctcopy; i++ )
      [result appendFormat:@"%c", base64_encodingTable[outbuf[i]]];
    
    for( i = ctcopy; i < 4; i++ )
      [result appendString:@"="];
    
    ixtext += 3;
    charsonline += 4;
    
    if( lineLength > 0 ) {
      if( charsonline >= lineLength ) {
        charsonline = 0;
        [result appendString:@"\n"];
      }
    }
  }
  
  return [NSString stringWithString:result];
}

+ (NSData *) base64Decoding:(NSString*) string
{
  NSMutableData *mutableData = nil;
  
  if( string ) {
    unsigned long ixtext = 0;
    unsigned long lentext = 0;
    unsigned char ch = 0;
    unsigned char inbuf[4] = {};
    unsigned char outbuf[3];
    short i = 0, ixinbuf = 0;
    BOOL flignore = NO;
    BOOL flendtext = NO;
    NSData *base64Data = nil;
    const unsigned char *base64Bytes = nil;
    
    // Convert the string to ASCII data.
    base64Data = [string dataUsingEncoding:NSASCIIStringEncoding];
    base64Bytes = [base64Data bytes];
    mutableData = [NSMutableData dataWithCapacity:[base64Data length]];
    lentext = [base64Data length];
    
    while( YES ) {
      if( ixtext >= lentext ) break;
      ch = base64Bytes[ixtext++];
      flignore = NO;
      
      if( ( ch >= 'A' ) && ( ch <= 'Z' ) ) ch = ch - 'A';
      else if( ( ch >= 'a' ) && ( ch <= 'z' ) ) ch = ch - 'a' + 26;
      else if( ( ch >= '0' ) && ( ch <= '9' ) ) ch = ch - '0' + 52;
      else if( ch == '+' ) ch = 62;
      else if( ch == '=' ) flendtext = YES;
      else if( ch == '/' ) ch = 63;
      else flignore = YES;
      
      if( ! flignore ) {
        short ctcharsinbuf = 3;
        BOOL flbreak = NO;
        
        if( flendtext ) {
          if( ! ixinbuf ) break;
          if( ( ixinbuf == 1 ) || ( ixinbuf == 2 ) ) ctcharsinbuf = 1;
          else ctcharsinbuf = 2;
          ixinbuf = 3;
          flbreak = YES;
        }
        
        inbuf [ixinbuf++] = ch;
        
        if( ixinbuf == 4 ) {
          ixinbuf = 0;
          outbuf [0] = ( inbuf[0] << 2 ) | ( ( inbuf[1] & 0x30) >> 4 );
          outbuf [1] = ( ( inbuf[1] & 0x0F ) << 4 ) | ( ( inbuf[2] & 0x3C ) >> 2 );
          outbuf [2] = ( ( inbuf[2] & 0x03 ) << 6 ) | ( inbuf[3] & 0x3F );
          
          for( i = 0; i < ctcharsinbuf; i++ )
            [mutableData appendBytes:&outbuf[i] length:1];
        }
        
        if( flbreak )  break;
      }
    }
  }
  
  return mutableData;
}

+ (NSString *)convertToPinYin:(NSString *)str{
  if ([NgnStringUtils isNullOrEmpty:str]) {
    return @"";
  }
  CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef)str);
  CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
  CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
  
  return (__bridge NSString *)(string);
}

//  Add new by Khai Le on 25/10/2017
+ (NSDictionary *)convertToDictionaryFromJsonString: (NSString *)payload {
    NSData *data = [payload dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    return jsonDict;
}

+ (NSString *)convertDictionaryToJsonString:(NSDictionary *)dictionary {
    NSString *payload = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
    return payload;
}

+ (NSString *)getGroupIdFromString: (NSString *)groupString {
    NSString *result = groupString;
    NSRange range = [groupString rangeOfString:@"@"];
    if (range.location != NSNotFound) {
        result = [groupString substringToIndex: range.location];
    }
    return result;
}

//  Add new by Khai Le on 07/11/2017
+ (NSString *)transformedValue:(double)convertedValue
{
    int multiplyFactor = 0;
    
    NSArray *tokens = @[@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB", @"ZB", @"YB"];
    
    while (convertedValue > 1024) {
        convertedValue /= 1024;
        multiplyFactor++;
    }
    
    return [NSString stringWithFormat:@"%4.2f %@",convertedValue, tokens[multiplyFactor]];
}

+ (NSString *)getFullGroupIdFromString: (NSString *)groupString
{
    NSArray *tmpArr = [groupString componentsSeparatedByString:@"/"];
    if (tmpArr.count > 0) {
        return [tmpArr objectAtIndex: 0];
    }
    return @"";
}

//  Add new by Khai Le on 30/11/2017
+ (NSString *)getValueOfKey: (NSString *)key fromString: (NSString *)string {
    if (string == nil || [string isEqualToString:@""]) {
        return @"";
    }else {
        NSArray *tmpArr = [string componentsSeparatedByString:@";"];
        if (tmpArr.count > 0) {
            for (int iCount=0; iCount<tmpArr.count; iCount++) {
                NSString *tmpStr = [tmpArr objectAtIndex: iCount];
                if (![tmpStr isEqualToString:@""]) {
                    NSArray *subArr = [tmpStr componentsSeparatedByString:@"="];
                    if (subArr.count >= 2) {
                        NSString *curKey = [subArr objectAtIndex: 0];
                        NSString *value = [subArr objectAtIndex: 1];
                        if (curKey != nil && [curKey isEqualToString: key]) {
                            if (value != nil) {
                                return value;
                            }
                            return @"";
                        }
                    }
                }
            }
        }
        return @"";
    }
}

//  [Khai le - 31/20/2018]
+ (NSString*)decodeURLString: (NSString *)urlStr {
    return (__bridge NSString *) CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef) urlStr, CFSTR(""), kCFStringEncodingUTF8);
}

+ (TARGET_APP)flagTarget{
    /*Values:
     0 -> FacePro.
     1 -> Xpert system.
     2 -> CCS Remote Survey
     3-> Porsche
     4-> Cloud Ship Inspection
     5-> Vmeeting(VNPT)
    */
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    if ([bundleIdentifier isEqualToString:@"com.softfoundry.facepro"]) {
        return FACEPRO;
    }else if ([bundleIdentifier isEqualToString:@"com.softfoundry.esfp"]){
        return EXPERT_SYSTEM;
    }else if ([bundleIdentifier isEqualToString:@"com.softfoundry.esfpccs"]){
        return CCS;
    }else if ([bundleIdentifier isEqualToString:@"com.softfoundry.porsche"]){
        return PORSCHE;
    }else if ([bundleIdentifier isEqualToString:@"com.softfoundry.esfpcsi"]){
        return CSI;
    }else if ([bundleIdentifier isEqualToString:@"com.softfoundry.vmeetingsf"]){
        return VMEETING;
    }
    return FACEPRO;
}
+ (BOOL)targetSupportRemoteGuidance{
    if ([NgnStringUtils flagTarget] == EXPERT_SYSTEM || [NgnStringUtils flagTarget] == CCS || [NgnStringUtils flagTarget] == PORSCHE || [NgnStringUtils flagTarget] == CSI){
        return true;
    }else{
        return false;
    }
}
+ (BOOL)MCUVersionSupport:(NSString *)ver{
    if (ver.length == 0) {
        return NO;
    }
    NSString *version = [ver stringByReplacingOccurrencesOfString:@"sfmcu/" withString:@""];
    NSArray *arr = [version componentsSeparatedByString:@"."];
    int str0 = [arr[0] intValue];
    int str1 = [arr[1] intValue];
    int str2 = 0;
    if (arr.count > 2) {
        str2 = [arr[2] intValue];
    }
    if (str0 == 4) {
        if (str1 == 4) {
            if (str2 > 18) {
                return YES;
            }else{
                return NO;
            }
        }else if(str1 > 4){
            return YES;
        }else{
            return NO;
        }
    }else if(str0 > 4){
        return YES;
    }else{
        return NO;
    }
}
// Add new by Thanh Nguyen on 06/11/2019
+ (BOOL)detectAPIVersionForCheckPasswordMeeting:(NSString *)apiVersion {
    BOOL isSupport = NO;
    
    NSArray *components = [apiVersion componentsSeparatedByString:@"."];
    NSInteger firstComponent = ([[components firstObject] length] > 0) ? [[components firstObject] integerValue] : 0;
    
    if (firstComponent > 5) {
        isSupport = YES;
    } else if ([[components firstObject] integerValue] == 5) {
        if ([components count] >= 2) {
            NSInteger secondComponent = ([[components objectAtIndex:1] length] > 0) ? [[components objectAtIndex:1] integerValue] : 0;
            
            if (secondComponent > 2) {
                isSupport = YES;
            } else if (secondComponent == 2) {
                if ([components count] >= 3) {
                    NSInteger thirdComponent = ([[components objectAtIndex:2] length] > 0) ? [[components objectAtIndex:2] integerValue] : 0;
                    
                    if (thirdComponent >= 2) {
                        isSupport = YES;
                    } else {
                        
                    }
                }
            } else {
                
            }
        } else {
            
        }
    } else {
        
    }
    
    return isSupport;
}


+(BOOL)string:(NSString*)str1 isGreaterThanOrEqualToString:(NSString*)str2{
    NSArray *nums1 = [str1 componentsSeparatedByString:@"."];
    NSArray *nums2 = [str2 componentsSeparatedByString:@"."];
    NSInteger n = nums1.count;
    NSInteger m = nums2.count;
    NSInteger less = (n < m) ? n : m;
    NSInteger i = 0;
    BOOL result = false;
    while (i < less){
        if([nums1[i] integerValue] > [nums2[i] integerValue]){
            result = true;
            break;
        }else if([nums1[i] integerValue] < [nums2[i] integerValue]){
            result = false;
            break;
        }else{
            i++;
            if (i == less) {
                if (n < m) {
                    result = false;
                }else{
                    result = true;
                }
                break;
            }
        }
    }
    return result;
}

+ (BOOL)getInitResolutionFirstTime{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL value = [userDefaults boolForKey:@"KInitResolutionFirstTime"];
    return value;
}

+ (void)setInitResolutionFirstTime:(BOOL)value{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:@"KInitResolutionFirstTime"];
    [userDefaults synchronize];
}
+ (NSString *)ngnUniqueString{
    NSString *result;
    NSString *time = [NSString stringWithFormat:@"%f", [NgnDateTimeUtils getIntervalCurrentDateTime]];
    NSString *unique = [self uuidUnique];
    result = [NSString stringWithFormat:@"%@%@",time,unique];
    return result;
}
+ (NSString *)uuidUnique{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge NSString *)uuidStringRef;
}

+(NSDictionary*) getQueryParameters: (NSURL*) url {
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSURLComponents* urlCompents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:false];
    NSArray<NSURLQueryItem *> *queryItems = [urlCompents queryItems];
   
    if(queryItems != nil) {
        for(NSURLQueryItem* item in queryItems) {
            [dict setObject:item.value forKey:item.name];
        }
    }
    return dict;
}

+ (NSString*) getQueryAfterRemoveKeys: (NSURL*) url withKeys: (NSArray*) keys {
    
    NSString* ret = @"";
    NSURLComponents* urlCompents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:false];
    NSArray<NSURLQueryItem *> *queryItems = [urlCompents queryItems];
   
    if(queryItems != nil) {
        for(NSURLQueryItem* item in queryItems) {
            bool bFind = false;
            for(NSString* key in keys) {
                if( [key isEqualToString: item.name] ) {
                    bFind = true;
                    break;
                }
            }
            
            if(!bFind) {
                if(ret.length > 0) {
                    ret = [ret stringByAppendingString: @"&"];
                }
                ret = [ret stringByAppendingFormat:@"%@=%@", item.name, [NgnStringUtils urlEncodedString:  item.value]];
            }
        }
    }
    return ret;
}


+ (NSString*) decodeUriData: (NSString*) encryptContent {
    NSString *verifyCode = @"sfx&Ur1$";
    NSString *key = [NgnStringUtils oddString: [[NgnStringUtils md5:verifyCode] substringWithRange:NSMakeRange(8, 16)]];
    NSString* strRet = [NgnCryptorHelper decrypt:encryptContent  key: key IV: verifyCode];
    if(strRet.length >= 32) {
        strRet = [strRet substringFromIndex: 32];
        return strRet;
    }else{
        return @"";
    }
}


@end
