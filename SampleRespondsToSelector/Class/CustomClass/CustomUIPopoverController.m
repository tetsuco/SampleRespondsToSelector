//
//  CustomUIPopoverController.m
//  SampleRespondsToSelector
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomUIPopoverController.h"

@implementation UIPopoverController(Add)

// 該当コントローラが使用しているデリゲートメソッドをNSLogで確認
- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSLog(@"%s %@", class_getName([self class]), NSStringFromSelector(aSelector));
    
    return [super respondsToSelector:aSelector];
}

// オーバーライド
- (void)dimmingViewWasTapped:(id)tapped
{
    // dismissPopoverAnimatedさせない
}

@end
