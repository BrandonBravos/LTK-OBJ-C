//
//  PostImageCvCell.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "PostImageCvCell.h"
#import <UIKit/UIKit.h>


@interface PostImageCvCell ()
@property (strong, nonatomic) UIImage * _Nullable postImage;


@end

@implementation PostImageCvCell



-(void)setCellImage: (UIImage*)image{
    self.postImage = image;
    
    self.cellImageView = [[UIImageView alloc] initWithFrame: CGRectZero];
    self.cellImageView.translatesAutoresizingMaskIntoConstraints = false;
    self.cellImageView.clipsToBounds = YES;
    self.cellImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview: self.cellImageView];
    [self.cellImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = YES;
    [self.cellImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0].active = YES;
    [self.cellImageView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0].active = YES;
    [self.cellImageView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = YES;

    [self.cellImageView setImage:self.postImage];

}


@end
