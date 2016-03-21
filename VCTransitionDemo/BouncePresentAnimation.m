//
//  BouncePresentAnimation.m
//  VCTransitionDemo
//
//  Created by 王 巍 on 13-10-13.
//  Copyright (c) 2013年 王 巍. All rights reserved.
//

#import "BouncePresentAnimation.h"

@implementation BouncePresentAnimation
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.8f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. Set init frame for toVC
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
    
    // 3. Add toVC's view to containerView
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         toVC.view.frame = finalFrame;
                         
                         fromViewController.view.transform = CGAffineTransformScale(fromViewController.view.transform, 0.9, 0.9);
                         fromViewController.view.alpha = 0.5;
                         
                         
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
    
    
    //    [UIView animateWithDuration:duration animations:^{
    //        toVC.view.frame = finalFrame;
    //
    //        fromViewController.view.transform = CGAffineTransformScale(fromViewController.view.transform, 0.9, 0.9);
    //        fromViewController.view.alpha = 0.5;
    //
    //    } completion:^(BOOL finished) {
    //        [transitionContext completeTransition:YES];
    //    }];
}
@end
