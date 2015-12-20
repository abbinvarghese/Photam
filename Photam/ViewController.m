//
//  ViewController.m
//  Photam
//
//  Created by Abbin Varghese on 20/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "ViewController.h"
#import "PListsTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 52;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.height/4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PListsTableViewCell" forIndexPath:indexPath];
    int rndValue = (((float)arc4random()/0x100000000)*14);
    int rndValue2 = (((float)arc4random()/0x100000000)*9999);
    NSString *dummyImageName = [NSString stringWithFormat:@"%i.jpg",rndValue];
    [cell.imagePreview setImage:[UIImage imageNamed:dummyImageName]];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%ikm away",rndValue2];
    return cell;
}
@end
