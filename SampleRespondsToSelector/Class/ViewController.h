//
//  ViewController.h
//  SampleRespondsToSelector
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

@interface ViewController : UIViewController <TableViewControllerDelegate, UIPopoverControllerDelegate> {
    UIButton *btn;
}

@property (strong, nonatomic) UIPopoverController *popOver;


/* メソッド */

- (void)btnAction:(UIButton*)sender;


/* Delegateメソッド */

- (void)tableViewControllerDelegateDidFinish:(NSString*)getData;


@end
