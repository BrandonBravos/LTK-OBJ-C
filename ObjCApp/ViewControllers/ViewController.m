//
//  ViewController.m
//  ObjCApp
//
//  Created by Brandon Bravos on 12/11/22.
//

#import "ViewController.h"
#import "LtkPost.h"
#import "NetworkManager.h"
#import "PostImageTVCell.h"
#import "DisplayViewController.h"
#import "Profile.h"

@interface ViewController ()

@property (strong, nonatomic)NSMutableArray<Profile *> *profileArray;
@property (strong, nonatomic)NSMutableArray<Profile *> *loadedPostsArray;
@property (strong, nonatomic)NSMutableDictionary<NSString*, Profile*> *fetchUserDic;

@end

@implementation ViewController

NSString *cellId = @"cellId";
NSString *customCellID = @"ImageCell";

- (void)viewDidLoad {
   [super viewDidLoad];
    [self initializeData];
    [self setUpTableView];
    [self networkCall];
}

-(void)networkCall{
    NetworkManager *networkManager = NetworkManager.new;
    [networkManager fetchData:^(NSMutableArray * _Nullable data) {
        self.profileArray = data;
        [self createUserFetchDic];
        for(Profile *profile in self.profileArray){
            LtkPost *ltk = profile.ltks;
            [networkManager donwloadImage:ltk.heroImageUrl withCompletion:^(UIImage * _Nullable data) {
                [self.loadedPostsArray addObject: self.fetchUserDic[ltk.heroImageUrl]];
                ltk.image = data;
                [self.tableView reloadData];
            }];
        }
        [self.tableView reloadData];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DisplayViewController *vc2 = DisplayViewController.new;
    [vc2 setUser:self.loadedPostsArray[indexPath.row]];
    [[self navigationController] pushViewController:vc2 animated:false];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.loadedPostsArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImage *img = self.loadedPostsArray[indexPath.row].ltks.image;
    if (img != nil){ return [self getHeightAspectRatio:img :self.view.bounds.size.width]; }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostImageTVCell *cell = [tableView dequeueReusableCellWithIdentifier:customCellID forIndexPath:indexPath];
    [cell setCellImage:self.loadedPostsArray[indexPath.row].ltks.image];
    return cell;
}

-(void)setUpTableView{
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor grayColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier: cellId];
    [self.tableView registerClass:[PostImageTVCell class] forCellReuseIdentifier: customCellID];

    self.navigationItem.title = @"Discover";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}

-(void) initializeData{
    self.profileArray = NSMutableArray.new;
    self.loadedPostsArray  = NSMutableArray.new;
    self.fetchUserDic  = NSMutableDictionary.new;
}

-(void)createUserFetchDic{
    for (Profile *profile in self.profileArray){
        self.fetchUserDic[profile.ltks.heroImageUrl] = profile;
    }
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
