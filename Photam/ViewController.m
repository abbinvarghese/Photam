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

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadIndicator;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property (nonatomic,strong) NSMutableArray *spotsArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spotsArray = [[NSMutableArray alloc]init];
    [self setNeedsStatusBarAppearanceUpdate];
    [self.listTableView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    [self refresh];
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

-(void)refresh{
    [self.loadIndicator startAnimating];
    
}

@end
