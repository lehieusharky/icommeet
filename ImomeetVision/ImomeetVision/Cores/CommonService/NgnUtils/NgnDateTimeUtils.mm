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
#import "NgnDateTimeUtils.h"


@implementation NgnDateTimeUtils


+(NSDateFormatter*) historyEventDuration{
	static NSDateFormatter* sHistoryEventDuration = nil;
	if(!sHistoryEventDuration){
		sHistoryEventDuration = [[NSDateFormatter alloc] init];
        [sHistoryEventDuration setDateFormat:@"mm:ss"];
	}
	return sHistoryEventDuration;
}

+(NSDateFormatter*) historyEventDate{
	static NSDateFormatter* sHistoryEventDate = nil;
	if(!sHistoryEventDate){
		sHistoryEventDate = [[NSDateFormatter alloc] init];
        [sHistoryEventDate setTimeStyle:NSDateFormatterNoStyle];
        [sHistoryEventDate setDateStyle:NSDateFormatterMediumStyle];
	}
	return sHistoryEventDate;
}

+(NSDateFormatter*) chatDate{
	static NSDateFormatter* sChatDate = nil;
	if(!sChatDate){
		sChatDate = [[NSDateFormatter alloc] init];
        [sChatDate setDateFormat:@"MMMM dd, yyyy HH:mm"];
	}
	return sChatDate;
}

+(NSDateFormatter*) historyEventTime
{
	static NSDateFormatter* sTime = nil;
	if(!sTime){
		sTime = [[NSDateFormatter alloc] init];
        [sTime setDateFormat:@"HH:mm"];
	}
	return sTime;
}

//  Convert time interval to nsstring
+ (NSString *)getDateStringFromTimeInterval: (double)timeInterval
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    
    if ([calendar isDateInToday:date]) {
        return NSLocalizedString(@"Today", nil);
    } else if ([calendar isDateInYesterday:date]) {
        return NSLocalizedString(@"Yesterday", nil);
    } else {
        NSString *formattedDateString = [dateFormatter stringFromDate:date];
        //  [Khai Le - 14/12/2018]
        if (formattedDateString == nil || [formattedDateString isEqualToString:@""]) {
            timeInterval = timeInterval/1000000;    //  try to convert from microseconds to seconds
            date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
            if ([calendar isDateInToday:date]) {
                return NSLocalizedString(@"Today", nil);
            } else if ([calendar isDateInYesterday:date]) {
                return NSLocalizedString(@"Yesterday", nil);
            } else {
                formattedDateString = [dateFormatter stringFromDate:date];
                return formattedDateString;
            }
        }
        return formattedDateString;
    }
}

+ (NSString *)getFullDateStringFromTimeInterval: (double)timeInterval
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    if ([calendar isDateInToday:date]) {
        return NSLocalizedString(@"Today", nil);
    } else if ([calendar isDateInYesterday:date]) {
        return NSLocalizedString(@"Yesterday", nil);
    } else {
        NSString *formattedDateString = [dateFormatter stringFromDate:date];
        return formattedDateString;
    }
}

+ (NSString *)getTimeStringFromTimeInterval:(double)timeInterval {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}

+ (int)getDaysBeforeCurrentWithTimeInterval:(double)timeInterval {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    return [self getDaysBeforeCurrentWithDate:date];
}

+ (int)getDaysBeforeCurrentWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    if ([calendar isDateInToday:date]) {
        return 0;
    } else if ([calendar isDateInYesterday:date]) {
        return 1;
    } else {
        NSDate *currentDate = [NSDate date];
        NSUInteger start = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitEra forDate:date];
        NSUInteger end = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitEra forDate:currentDate];
        return abs((int)(start - end));
    }
}

+ (double)convertDateStringToTimeInterval: (NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: dateString];
    return [date timeIntervalSince1970];
}

+ (double)getIntervalCurrentDateTime {
    NSTimeInterval timeInSeconds = [[NSDate date] timeIntervalSince1970];
    return timeInSeconds;
}

+ (NSString *)secondsToTimeString:(long)seconds {
    long hours = seconds / (60 * 60);
    long minutes = seconds / 60;
    long realSeconds = seconds % 60;
    NSString *hourString = @"";
    if (hours > 0) {
        hourString = [NSString stringWithFormat:@"%02ld:", hours];
    }
    NSString *timeString = [NSString stringWithFormat:@"%@%02ld:%02ld", hourString, minutes, realSeconds];
    return timeString;
}
+ (NSString *)getDateTimeFromCurrentDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *formattedDateString = [dateFormatter stringFromDate:[NSDate date]];
    return formattedDateString;
}

+ (NSString *)getDateTimeFromTimeInterval:(double)timeInterval{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970: timeInterval];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    return formattedDateString;
}
+ (NSString *)getCurrentTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss.SSSS"];
    NSTimeZone *currentTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:currentTimeZone];
    return [dateFormatter stringFromDate:[NSDate date]];
}
@end
