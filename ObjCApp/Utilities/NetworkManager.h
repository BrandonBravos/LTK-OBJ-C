//
//  NetworkManager.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
-(void) fetchData:(void (^)(NSMutableArray * _Nullable data))completion;
-(void) donwloadImage:(NSString*)withUrlString withCompletion: (void (^)(UIImage * _Nullable data))completion;

@end

NS_ASSUME_NONNULL_END
