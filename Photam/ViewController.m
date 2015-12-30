//
//  ViewController.m
//  Photam
//
//  Created by Abbin Varghese on 20/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "ViewController.h"
#import "PListsTableViewCell.h"
#import "PSpots.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic,strong) NSMutableArray *spotsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spotsArray = [[NSMutableArray alloc]init];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.listTableView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    [self refresh:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.spotsArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height/4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PListsTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)refresh:(int)i{
    i++;
    int size = 0;
    float lat = [self randomFloatBetween:8 and:12];
    float lon = [self randomFloatBetween:74 and:77];
    
    PSpots *spotObj = [PSpots object];
    spotObj.spotTitle = @"Sample Title";
    spotObj.spotDescription = @"The Parse platform provides a complete backend solution for your mobile application. Our goal is to totally eliminate the need for writing server code or maintaining servers.";
    spotObj.rating = [NSNumber numberWithInt:(int)[self randomFloatBetween:0 and:5]];
    spotObj.latLon = [PFGeoPoint geoPointWithLatitude:lat longitude:lon];
    NSMutableArray *imageArray = [[NSMutableArray alloc]init];
    for (int k = 0; k<5; k++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",(int)[self randomFloatBetween:0 and:72]];
        NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:imageName], 1.0);
         NSLog(@"File size is : %.2f MB",(float)imageData.length/1024.0f/1024.0f);
        size = size + imageData.length/1024.0f/1024.0f;
        if (imageData==nil) {
            imageName = [NSString stringWithFormat:@"%d.jpg",(int)[self randomFloatBetween:0 and:75]];
            imageData = UIImageJPEGRepresentation([UIImage imageNamed:imageName], 1.0);
        }
        else{
            PFFile *imageFile = [PFFile fileWithData:imageData];
            [imageArray addObject:imageFile];
        }
    }
    
    spotObj.imageArray = imageArray;
    
    [spotObj saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
        if (succeeded) {
            NSLog(@"Succeede = %i",i);
            NSLog(@"Size = %i",size);
            [self refresh:i];
        }
        else{
            NSLog(@"Failed = %i",i);
        }
    }];
    
}

- (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

@end
