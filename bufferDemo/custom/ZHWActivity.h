//
//  QUYLActivity.h
//  turnImage
//  Created by shuzhenguo on 14-8-27.
//  Copyright (c) 2014年 shuzhenguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"


@interface ZHWActivity : UIButton
{
    BOOL animating;
    
    
    UIActivityIndicatorView  *_indicatorView;
}
@property (nonatomic) CGFloat animationDuration;
+(ZHWActivity *)getActivity;

/*
 
 需要缓冲图片qy_loading.png
*/

//初始化缓冲
-(void)startActivity :(UIView *)view;
//判断动画
- (BOOL)isAnimating;
//开始
- (void)startAnimating;
//消失
- (void)stopAnimating;


/*
 系统缓冲
*/

@property (nonatomic, strong, readonly) UIActivityIndicatorView *indicatorView;
- (UIActivityIndicatorView *)indicatorView;





/*
 mb缓冲及提示语
 
 */
@property (nonatomic,retain) MBProgressHUD *progressHUD;
-(void)showProgressInView:(UIView *)superview;
-(void)hideProgress;
-(void)showHUD:(NSString *)title withHiddenDelay:(NSTimeInterval)delay;




/*
 sv缓冲及提示语直接用
*/

/*
 Toast缓冲及提示语直接用
 */

@end
