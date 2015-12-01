//
//  QUYLActivity.m
//  turnImage
//  Created by shuzhenguo on 14-8-27.
//  Copyright (c) 2014年 shuzhenguo. All rights reserved.
//

#import "ZHWActivity.h"
#import <QuartzCore/QuartzCore.h>

@implementation ZHWActivity

static ZHWActivity *activity=nil;


+(ZHWActivity*)getActivity{
    if (activity==nil) {
        activity=[[ZHWActivity alloc]init];
    }
    return activity;
}

-(void)startActivity :(UIView *)view{
    
    activity.center=view.center;
    activity.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
                                          UIViewAutoresizingFlexibleBottomMargin |
                                          UIViewAutoresizingFlexibleLeftMargin |
                                          UIViewAutoresizingFlexibleRightMargin);
    
    [view addSubview:activity];
    
    [activity startAnimating];

}



-(void)stopAnimating:(UIView *)view{

    [activity stopAnimating];

}



- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 28, 28)];
    if (self)
    {
        self.showsTouchWhenHighlighted = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"qy_loading"] forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.showsTouchWhenHighlighted = NO;
        [self setBackgroundImage:[UIImage imageNamed:@"qy_loading"] forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        self.showsTouchWhenHighlighted = YES;
        [self setBackgroundImage:[UIImage imageNamed:@"qy_loading"] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - Public Methods

- (BOOL)isAnimating
{
    CAAnimation *spinAnimation = [self.layer animationForKey:@"spinAnimation"];
    return (animating || spinAnimation);
}

- (void)startAnimating
{
    self.hidden=NO;
    animating = YES;
    [self spin];
}


- (void)stopAnimating
{
    self.hidden=YES;
    animating = NO;
}

- (void)spin
{
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.byValue = [NSNumber numberWithFloat:2*M_PI];
    spinAnimation.duration = self.animationDuration;
    spinAnimation.delegate = self;
    [self.layer addAnimation:spinAnimation forKey:@"spinAnimation"];
}

#pragma mark - Animation Delegates

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
    if (animating)
    {
        [self spin];
    }
}

#pragma mark - Property Methods

- (CGFloat)animationDuration
{
    if (!_animationDuration)
    {
        _animationDuration = 1.0f;
    }
    return _animationDuration;
}


/*
 系统
 */
- (UIActivityIndicatorView *)indicatorView
{
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_indicatorView stopAnimating];
        _indicatorView.frame=CGRectMake(0, 0, 90, 90);
        [self.appDelegate.window addSubview:_indicatorView];
        
        _indicatorView.center=self.appDelegate.window.center;
        
    }
    return _indicatorView;
}

/*
 
 
 */

//显示
-(void)showProgressInView:(UIView *)superview
{
    if (self.progressHUD.superview) {
        return;
    }
    self.progressHUD = [[MBProgressHUD alloc] initWithView:superview];
    //    self.progressHUD.labelText = labelText;
    //    self.progressHUD.detailsLabelText = detailText;
    //    self.progressHUD.dimBackground = animated;
    [superview addSubview:self.progressHUD];
    [self.progressHUD show:YES];
    

}
//隐藏
-(void)hideProgress
{
    
    if (self.progressHUD.superview) {
        [self.progressHUD hide:YES];

        [self.progressHUD removeFromSuperview];


    }

}


//提示语
-(void)showHUD:(NSString *)title withHiddenDelay:(NSTimeInterval)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithWindow:self.appDelegate.window];
    
    //    hud.frame=CGRectMake(0, 0, 80, 80);
    [self.appDelegate.window addSubview:hud];
    
    
    //    hud.backgroundColor=[UIColor blackColor];
    //    [self.appDelegate.window bringSubviewToFront:hud];
    
    hud.mode = MBProgressHUDModeText;
    hud.labelText = title;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(delay);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}



-(AppDelegate *)appDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


@end
