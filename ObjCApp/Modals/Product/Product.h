//
//  Product.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Product : NSObject
@property (strong, nonatomic) UIImage * _Nullable productImage;


@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) NSString *imageURL;
@property (strong, nonatomic) NSString *hyperlink;

- (void)decodeFromDict:(NSDictionary*)dict;



@end

NS_ASSUME_NONNULL_END
