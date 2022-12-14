//
//  DisplayViewController.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <UIKit/UIKit.h>
#import "Profile.h"
NS_ASSUME_NONNULL_BEGIN

@interface DisplayViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (strong, nonatomic) Profile *profile;

-(void)setUser:(Profile*)user;
@end

NS_ASSUME_NONNULL_END
