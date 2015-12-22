//
//  ViewController.m
//  Photam
//
//  Created by Abbin Varghese on 20/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "ViewController.h"
#import "PListsTableViewCell.h"
#import <Parse/Parse.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic,strong) NSArray *spotsArray;
@property (weak, nonatomic) IBOutlet UIImageView *backGroundImageView;



@end

@implementation ViewController

{
    NSMutableArray *ars;
    int selectedIndex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    selectedIndex = INT16_MAX;
    [self.listTableView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    ars = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<=54; i++) {
        int rndValue = (((float)arc4random()/0x100000000)*13);
        [ars addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%i.jpg",rndValue]]];
    }
    // Do any additional setup after loading the view, typically from a nib.
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
    return ars.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.row == selectedIndex ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.height/4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PListsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PListsTableViewCell" forIndexPath:indexPath];
    int rndValue2 = (((float)arc4random()/0x100000000)*9999);
    [cell.imagePreview setImage:[ars objectAtIndex:indexPath.row]];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%ikm away",rndValue2];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    selectedIndex = INT16_MAX;
    [self.listTableView beginUpdates];
    [self.listTableView endUpdates];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (selectedIndex == indexPath.row) {
        selectedIndex = INT16_MAX;
    }
    else{
        selectedIndex = (int)indexPath.row;
    }
    [tableView beginUpdates];
    [tableView endUpdates];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}




@end
