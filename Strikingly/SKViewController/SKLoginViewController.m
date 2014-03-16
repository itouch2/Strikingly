//
//  SKLoginViewController.m
//  Strikingly
//
//  Created by Tu You on 14-3-16.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKLoginViewController.h"
#import "SKLoginModel.h"

@interface SKLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (nonatomic, strong) SKLoginModel *loginModel;

@end

@implementation SKLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __block typeof(self) bself = self;
    __weak typeof(self) wself = bself;
    
    self.loginModel = [[SKLoginModel alloc] init];
    self.loginModel.completionBlock = ^(SKBaseModel *model) {
        if (model.responseStatus)
        {
            [wself loginSuccess];
        }
        else
        {
            [wself loginFailed];
        }
    };
    
    
    [self.userNameTextField becomeFirstResponder];
}

- (void)loginSuccess
{
    
}

- (void)loginFailed
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
