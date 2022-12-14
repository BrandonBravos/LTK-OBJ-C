//
//  LtkResponse.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "LtkResponse.h"

@implementation LtkResponse

-(NSMutableArray*)createProfilesArray{
    NSMutableDictionary* profileDic = @{}.mutableCopy;
    NSMutableDictionary* productDic = @{}.mutableCopy;

    
    for (Profile *profile in self.profiles){
        [profileDic setObject: profile  forKey: profile.profileId];
    }
    
    for (Product *product in self.products){
        [productDic setObject: product  forKey: product.productId];
    }
    

    
    for (LtkPost *ltk in self.ltks){
        ltk.products =  NSMutableArray.new;
        Profile *profile = profileDic[ltk.profileId];
            for(NSString *product in ltk.productIds){
                Product *productObj = productDic[product];
                [ltk.products addObject: productObj];
            }
            

        profile.ltks = ltk;
    }
    
    return self.profiles;
}

-(void)decode: (NSArray*)jsonArray{
    // array of our profiles response
    NSArray *profileArray = [jsonArray valueForKey:@"profiles"];
    NSMutableArray<Profile *> *profiles = NSMutableArray.new;

    // array of our ltk response
    NSArray *ltkArray = [jsonArray valueForKey:@"ltks"];
    NSMutableArray<LtkPost *> *ltks = NSMutableArray.new;

    // array of our products response
    NSArray *productsArray = [jsonArray valueForKey:@"products"];
    NSMutableArray<Product *> *products = NSMutableArray.new;

    
    // create profiles
    for (NSDictionary *profileDic in profileArray){
        Profile *profile = Profile.new;
        [profile decodeFromDict:profileDic];
        [profiles addObject:profile];
        
        NSLog(@"Profiles: %@", profile.avatarUrl);
    }
    // create ltks
    for (NSDictionary *ltkDicts in ltkArray){
        LtkPost *ltk = LtkPost.new;
        [ltk decodeFromDict:ltkDicts];
        [ltks addObject:ltk];
    }
   
    // create product
    for (NSDictionary *productDic in productsArray){
        Product *product = Product.new;
        [product decodeFromDict:productDic];
        [products addObject:product];
    }
  
    
    self.profiles = profiles;
    self.ltks = ltks;
    self.products = products;
    
    self.ltks = ltks;
}
@end
