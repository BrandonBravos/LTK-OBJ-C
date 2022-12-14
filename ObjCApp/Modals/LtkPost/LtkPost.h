//
//  LtkPost.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface LtkPost : NSObject
@property (strong, nonatomic) UIImage * _Nullable image;
@property (strong, nonatomic) NSMutableArray<Product*> * _Nullable products;

//    /// an array of products related to this post
// var productIds: [String] = []

//MARK: From Api
@property (strong, nonatomic) NSString *heroImageUrl;
@property (strong, nonatomic) NSString *profileId;

@property (strong, nonatomic) NSMutableArray<NSString*> * _Nullable productIds;


- (void)decodeFromDict:(NSDictionary*)dict;


@end

NS_ASSUME_NONNULL_END
