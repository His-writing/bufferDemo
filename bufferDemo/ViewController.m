//
//  ViewController.m
//  bufferDemo
//
//  Created by shuzhenguo on 15/12/1.
//  Copyright © 2015年 shuzhenguo. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)startClick:(id)sender {
    if (![[ZHWActivity getActivity]isAnimating]) {
        [[ZHWActivity getActivity]startActivity:self.view];
    }
    
    
}
- (IBAction)shutdown:(id)sender {
    
    [[ZHWActivity getActivity]stopAnimating];
}


- (IBAction)startSystemClick:(id)sender {
    [[[ZHWActivity getActivity]indicatorView]startAnimating];
}

- (IBAction)shutdownSystemClick:(id)sender {
    [[[ZHWActivity getActivity]indicatorView]stopAnimating];
}
- (IBAction)mbStartClick:(id)sender {
    
    [[ZHWActivity getActivity]showProgressInView:self.view];
    
    [self performSelector:@selector(mbShutdown:) withObject:nil afterDelay:2.0f];

    
}
- (IBAction)mbShutdown:(id)sender {
    
    [[ZHWActivity getActivity]hideProgress];
}

- (IBAction)mbPrompt:(id)sender {
    
    [[ZHWActivity getActivity]showHUD:@"提示语" withHiddenDelay:1.0];
}


- (IBAction)svStartClick:(id)sender {
    
    
    [SVProgressHUD show];
}

- (IBAction)svShutdown:(id)sender {
    
    [SVProgressHUD dismiss];

}

- (IBAction)svPrompt:(id)sender {
    
    [SVProgressHUD showSuccessWithStatus:@"showSuccess"];
    [self performSelector:@selector(showErrorSV) withObject:nil afterDelay:3.0f];
}

-(void)showErrorSV{

    [SVProgressHUD showErrorWithStatus:@"showError"];

}
- (IBAction)t_prompt:(id)sender {
    [self .view makeToast:@"你好你好"];
}

- (IBAction)t_startClick:(id)sender {
    
    [self.view makeToastActivity:CSToastPositionCenter];
    [self performSelector:@selector(t_shutDown:) withObject:nil afterDelay:3.0f];

}

- (IBAction)t_shutDown:(id)sender {
    
    [self.view hideToastActivity];

}
@end
