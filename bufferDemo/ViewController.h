//
//  ViewController.h
//  bufferDemo
//
//  Created by shuzhenguo on 15/12/1.
//  Copyright © 2015年 shuzhenguo. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "ZHWActivity.h"

@interface ViewController : UIViewController
//图片缓冲
- (IBAction)startClick:(id)sender;
- (IBAction)shutdown:(id)sender;

//系统自带缓冲
- (IBAction)startSystemClick:(id)sender;
- (IBAction)shutdownSystemClick:(id)sender;

//sb
- (IBAction)mbStartClick:(id)sender;
- (IBAction)mbShutdown:(id)sender;

- (IBAction)mbPrompt:(id)sender;



//sv
- (IBAction)svStartClick:(id)sender;
- (IBAction)svShutdown:(id)sender;

- (IBAction)svPrompt:(id)sender;


//Toast
- (IBAction)t_prompt:(id)sender;

- (IBAction)t_startClick:(id)sender;

- (IBAction)t_shutDown:(id)sender;

@end

