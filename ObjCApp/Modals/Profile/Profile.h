//
//  Profile.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import "LtkPost.h"

NS_ASSUME_NONNULL_BEGIN

@interface Profile : NSObject
@property (strong, nonatomic) LtkPost * _Nullable ltks;
@property (strong, nonatomic) UIImage * _Nullable profileImage;

//MARK: From Api
@property (strong, nonatomic) NSString *avatarUrl;
@property (strong, nonatomic) NSString *profileId;


- (void)decodeFromDict:(NSDictionary*)dict;

@end

NS_ASSUME_NONNULL_END
