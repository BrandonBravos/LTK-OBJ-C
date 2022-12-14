//
//  LtkResponse.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import "LtkPost.h"
#import "Profile.h"
#import "Product.h"

NS_ASSUME_NONNULL_BEGIN

@interface LtkResponse : NSObject
@property (strong, nonatomic) NSMutableArray<Profile*> *profiles;
@property (strong, nonatomic) NSMutableArray<LtkPost*> *ltks;
@property (strong, nonatomic) NSMutableArray<Product*> *products;

-(void)decode: (NSArray*)jsonArray;
-(NSMutableArray*)createProfilesArray;
@end

NS_ASSUME_NONNULL_END
