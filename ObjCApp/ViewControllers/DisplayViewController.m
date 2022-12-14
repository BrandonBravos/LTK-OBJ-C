//
//  DisplayViewController.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/13/22.
//

#import "DisplayViewController.h"
#import "PostImageCvCell.h"
#import "NetworkManager.h"

@interface DisplayViewController ()
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray<Product *> *loadedProductsArray;

@end

@implementation DisplayViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NetworkManager *networkManager = NetworkManager.new;
    self.loadedProductsArray = NSMutableArray.new;
    for(Product *product in self.profile.ltks.products){
        [networkManager donwloadImage:product.imageURL withCompletion:^(UIImage * _Nullable data) {
            product.productImage = data;
            [self.loadedProductsArray addObject:product];
            NSLog(@"GOT DATA");

            [self.collectionView reloadData];
        }];
    }

  }


-(void)setUser:(Profile*)profile{
    self.profile = profile;
    [self setUpView];
}

//MARK: Delegates
  - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
  {
      return  section == 0 ? 1 : self.loadedProductsArray.count;
  }

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize viewBounds = self.view.bounds.size;
    
    UIImage *img = self.profile.ltks.image;
    CGFloat height = [self getHeightAspectRatio:img :self.view.bounds.size.width - 20];
    
    CGSize size = CGSizeMake(viewBounds.width - 20, height);
    if(indexPath.row == 0 && indexPath.section == 0) {return size;}
    return CGSizeMake(80, 80);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
  {
      PostImageCvCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier2" forIndexPath:indexPath];
      if (indexPath.section == 0){ [cell setCellImage:self.profile.ltks.image]; } else {
          [cell setCellImage: self.loadedProductsArray[indexPath.row].productImage];
      }
    
      return cell;
  }

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


// MARK: Layout
-(void)setUpView{
    //self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
   _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
   [_collectionView setDataSource:self];
   [_collectionView setDelegate:self];
   [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
   [_collectionView registerClass:[PostImageCvCell class] forCellWithReuseIdentifier:@"cellIdentifier2"];

   [self.view addSubview:_collectionView];
}

-(CGFloat)getHeightAspectRatio:(UIImage*)image :(CGFloat)withWidth{
    CGFloat imageHeight = image.size.height;
    CGFloat imageWidth = image.size.width;
    CGFloat ratio = imageHeight / imageWidth;

    CGFloat desiredWidth = withWidth;
    CGFloat newHeight = desiredWidth * ratio;
    return newHeight;
}


@end


