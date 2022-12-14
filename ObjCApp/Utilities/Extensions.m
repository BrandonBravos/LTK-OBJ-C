//
//  Extensions.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>




@interface NSString(MyAdditions)
+(NSString *)getCopyRightString;
@end

@implementation NSString(MyAdditions)

+(NSString *)getCopyRightString {
   return @"Copyright TutorialsPoint.com 2013";
}

@end
