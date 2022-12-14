//
//  PostImageCell.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "PostImageTVCell.h"
@interface PostImageTVCell ()
@property (strong, nonatomic) UIImageView *cellImageView;
@property (strong, nonatomic) UIImage * _Nullable postImage;


@end

@implementation PostImageTVCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    return  self;
}

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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    }

@end
