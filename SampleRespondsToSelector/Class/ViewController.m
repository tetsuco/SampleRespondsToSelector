//
//  ViewController.m
//  SampleRespondsToSelector
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize popOver = _popOver;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ボタン
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(0.0, 0.0, 180.0, 30.0);
    btn.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [btn setTitle:@"Popover" forState:UIControlStateNormal];  // 有効時
    [btn addTarget:self action:@selector(btnAction:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}


/* ============================================================================== */
#pragma mark - Button Action
/* ============================================================================== */
- (void)btnAction:(UIButton*)sender
{
    // TableViewController生成
    TableViewController *tableViewController;
    tableViewController = [[TableViewController alloc]
                           initWithNibName:@"TableViewController"
                           bundle:nil];
    tableViewController.contentSizeForViewInPopover = CGSizeMake(290, 280);
    tableViewController.delegate = self;
    
    // UINavigationを生成
    UINavigationController *tableViewNavController = [[UINavigationController alloc] initWithRootViewController:tableViewController];
    
    // タイトル設定
    tableViewNavController.navigationBar.topItem.title = @"テーブル";
    
    [tableViewNavController setNavigationBarHidden:NO];
    
    /* UIPopoverController */
    
    if (self.popOver == nil)
    {
        self.popOver = [[UIPopoverController alloc] initWithContentViewController:tableViewNavController];
        self.popOver.delegate = self;
    }
    
    // ポップオーバーが現在表示されていなければ表示する
    if (!self.popOver.popoverVisible)
    {
        [self.popOver presentPopoverFromRect:CGRectMake(sender.frame.origin.x - 40, sender.frame.origin.y - 10, 270, 216)
                                              inView:self.view
                            permittedArrowDirections:UIPopoverArrowDirectionDown   // 矢印の向きを下にする
                                            animated:YES];
    }
}


/* ============================================================================== */
#pragma mark - Delegete Method
/* ============================================================================== */
- (void)tableViewControllerDelegateDidFinish:(NSString*)getData
{
    // タイトルを変更する
    [btn setTitle:getData forState:UIControlStateNormal];
}


@end
