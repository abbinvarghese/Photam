//
//  PIntroViewController.m
//  Photam
//
//  Created by Abbin on 31/12/15.
//  Copyright © 2015 Abbin Varghese. All rights reserved.
//

#import "PIntroViewController.h"

@interface PIntroViewController ()

@end

@implementation PIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Welcome";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneClicked:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
    
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [[UIApplication sharedApplication].keyWindow setRootViewController:rootViewController];
                    }
                    completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
