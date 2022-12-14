//
//  NetworkManager.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "NetworkManager.h"
#import "LtkPost.h"
#import "LtkResponse.h"

@interface NetworkManager ()
@property (strong, nonatomic)NSMutableArray<LtkPost *> *ltks;

@end

@implementation NetworkManager

-(void) fetchData:(void (^)(NSMutableArray * _Nullable data))completion{
    NSLog(@"Fetching Data...");
    NSString *urlString = @"https://api-gateway.rewardstyle.com/api/ltk/v2/ltks/?featured=true&limit=5";
    NSURL *url = [NSURL URLWithString:urlString];
    
  [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
      // create json of response
      NSError *err;
      NSArray *responseJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
      if(err){
          NSLog(@"Failed to convert data to JSON %@", err);
          return;
      }
      
      // decode our api call
      LtkResponse *networkResponse = LtkResponse.new;
      [networkResponse decode:responseJson];
      NSMutableArray<Profile*> *profileArray = [networkResponse createProfilesArray];
      
      self.ltks = networkResponse.ltks;
      
      dispatch_async(dispatch_get_main_queue(), ^{
          completion(profileArray);
      });
      
      
      
  }] resume];
}

-(void) donwloadImage:(NSString*)withUrlString withCompletion: (void (^)(UIImage * _Nullable data))completion{
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: withUrlString]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([UIImage imageWithData: data]);
        });
    });
}

@end
