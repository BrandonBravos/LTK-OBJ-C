//
//  PostImageCvCell.h
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PostImageCvCell : UICollectionViewCell
-(void)setCellImage: (UIImage*)image;
@property (strong, nonatomic) UIImageView *cellImageView;

@end

NS_ASSUME_NONNULL_END
