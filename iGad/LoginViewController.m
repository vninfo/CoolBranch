//
//  LoginViewController.m
//  iGad
//
//  Created by Khanh Do on 7/3/15.
//  Copyright (c) 2015 Khanh Do. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()
{
    UIButton *btLogin;
    UIButton *btForgot;
    UIButton *btRegister;

    UITextField *tfUsername;
    UITextField *tfPassword;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor clearColor]];
    UIImageView *bkImage =   [[UIImageView alloc] initWithFrame:self.view.frame];
    [bkImage setImage:[UIImage imageNamed:@"LoginBackground"]];
    [self.view addSubview:bkImage];
    
    // Do any additional setup after loading the view.
    
    CGRect tfUsernameFrame;
    tfUsernameFrame = CGRectMake(30,  270, 315, 50);
    
    CGRect tfPasswordFrame;
    tfPasswordFrame = CGRectMake(30,  325, 315, 50);
    
    CGRect btLoginFrame;
    btLoginFrame = CGRectMake(30, 380, 315, 45);

    CGRect btForgotFrame;
    btForgotFrame = CGRectMake(30, 610, 315, 40);

    //Button login
    btLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [btLogin setFrame:btLoginFrame];
    [btLogin setTitle:@"SIGN IN" forState:UIControlStateNormal];
    UIColor * color = [UIColor colorWithRed:231/255.0f green:76/255.0f blue:60/255.0f alpha:0.85f];
    [btLogin setBackgroundColor:color];
    [btLogin.layer setCornerRadius:3.0];
    [btLogin.layer setMasksToBounds:YES];
    [btLogin.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
    [btLogin addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btLogin];
    
    
    //Label forgot password
    UILabel *lbforgotPassword = [[UILabel alloc] initWithFrame: CGRectMake(30, 425, 315, 30)];
    [lbforgotPassword setTextColor:[UIColor whiteColor]];
    [lbforgotPassword setText:@"For got password?"];
    [lbforgotPassword setTextAlignment:NSTextAlignmentCenter];
    [lbforgotPassword setFont:[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:13.0f]];
    [self.view addSubview:lbforgotPassword];

    //Label no account
    UILabel *noAccount = [[UILabel alloc] initWithFrame: CGRectMake(30, 580, 315, 30)];
    [noAccount setTextColor:[UIColor whiteColor]];
    [noAccount setText:@"Don't have an account?"];
    [noAccount setTextAlignment:NSTextAlignmentCenter];
    [noAccount setFont:[UIFont fontWithName:@"HelveticaNeue-LightItalic" size:13.0f]];
    [self.view addSubview:noAccount];
    
    //Forgot Password
    btForgot = [UIButton buttonWithType:UIButtonTypeCustom];
    [btForgot setFrame:btForgotFrame];
    [btForgot setTitle:@"CREATE NEW ACCOUNT" forState:UIControlStateNormal];
    UIColor * colorForgot = [UIColor colorWithRed:22/255.0f green:160/255.0f blue:133/255.0f alpha:0.7f];
    [btForgot setBackgroundColor:colorForgot];
    [btForgot.layer setCornerRadius:3.0];
    [btForgot.layer setMasksToBounds:YES];
    [btForgot.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0f]];
    [self.view addSubview:btForgot];
    
    tfUsername = [[UITextField alloc] initWithFrame:tfUsernameFrame];
    [tfUsername.layer setCornerRadius:5.0];
    [tfUsername.layer setMasksToBounds:YES];
    [tfUsername setPlaceholder:@"Username"];
    [tfUsername setTextAlignment:NSTextAlignmentCenter];
    [tfUsername setBorderStyle:UITextBorderStyleRoundedRect];
    [tfUsername setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
    UIColor *tfUsernameColor = [UIColor colorWithWhite:0.3 alpha:0.3];
    [tfUsername setBackgroundColor:tfUsernameColor];
    [tfUsername.layer setBorderWidth:0.3];
    [tfUsername.layer setBorderColor:[UIColor whiteColor].CGColor];
    [tfUsername setTextColor:[UIColor whiteColor]];
    [tfUsername setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [tfUsername setClearButtonMode:UITextFieldViewModeAlways];
    [self.view addSubview:tfUsername];
    
    tfPassword = [[UITextField alloc] initWithFrame:tfPasswordFrame];
    [tfPassword.layer setCornerRadius:5.0];
    [tfPassword.layer setMasksToBounds:YES];
    [tfPassword setPlaceholder:@"Password"];
    [tfPassword setTextAlignment:NSTextAlignmentCenter];
    [tfPassword setBorderStyle:UITextBorderStyleRoundedRect];
    [tfPassword setSecureTextEntry:YES];
    [tfPassword setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
    [tfPassword setBackgroundColor:tfUsernameColor];
    [tfPassword.layer setBorderWidth:0.3];
    [tfPassword.layer setBorderColor:[UIColor whiteColor].CGColor];
    [tfPassword setTextColor:[UIColor whiteColor]];
    [tfPassword setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [tfPassword setClearButtonMode:UITextFieldViewModeAlways];
    [self.view addSubview:tfPassword];
    
    UITapGestureRecognizer *tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
}



- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (void) doLogin
{
    UIStoryboard *storyboard = self.storyboard;
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"Tabbar"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
