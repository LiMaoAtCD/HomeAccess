//
//  Utility.h
//  HomeAccess
//
//  Created by AlienLi on 16/1/18.
//  Copyright © 2016年 MarcoLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject


+(BOOL)isMobileNumber:(NSString  * _Nullable) mobileNum;
+(BOOL)isValidPassword:(NSString * _Nullable) password;

@end
