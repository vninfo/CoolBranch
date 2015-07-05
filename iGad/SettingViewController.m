//
//  SettingViewController.m
//  iGad
//
//  Created by Khanh Do on 7/4/15.
//  Copyright (c) 2015 Khanh Do. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //Button login
    
    CGRect btLoginFrame;
    btLoginFrame = CGRectMake(30, 110, 315, 45);

    UIButton *btLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btLogin setFrame:btLoginFrame];
    [btLogin setTitle:@"SIGN OUT" forState:UIControlStateNormal];
    UIColor * color = [UIColor colorWithRed:231/255.0f green:76/255.0f blue:60/255.0f alpha:0.85f];
    [btLogin setBackgroundColor:color];
    [btLogin.layer setCornerRadius:3.0];
    [btLogin.layer setMasksToBounds:YES];
    [btLogin.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
    [btLogin addTarget:self action:@selector(doLogout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btLogin];
}

- (void) doLogout
{
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
