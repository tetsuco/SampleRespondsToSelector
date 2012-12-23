//
//  TableViewController.m
//  SampleRespondsToSelector
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"

@implementation TableViewController

@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //--------------------------------------------------
    // ナビゲーションバーにボタンを乗せる
    //--------------------------------------------------
    UIButton *rightBarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    rightBarBtn.frame = CGRectMake(0, 0, 60, 24);
    [rightBarBtn setTitle:@"ボタン" forState:UIControlStateNormal];  // 有効時
    [rightBarBtn addTarget:self action:@selector(rightBarBtnItmAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItm = [[UIBarButtonItem alloc] initWithCustomView:rightBarBtn];
    self.navigationItem.rightBarButtonItem = rightBarBtnItm;
    
    
    //--------------------------------------------------
    // テーブルを生成
    //--------------------------------------------------
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 290, 280) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}


/* ============================================================================== */
#pragma mark - Table
/* ============================================================================== */
// セクション数
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    // Return the number of sections.
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}

// 内容
- (UITableViewCell *)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // セル選択時の背景色を設定
    UIView *backgroundView = [[UIView alloc] init];
    backgroundView.backgroundColor = [UIColor brownColor];
    cell.selectedBackgroundView = backgroundView;
    
    // セル選択時の文字色を設定
    cell.textLabel.highlightedTextColor = [UIColor blueColor];
    
    // 項目
    cell.textLabel.text = [NSString stringWithFormat:@"項目 %d", indexPath.row];
    
    return cell;
}

// セルタップ時に呼び出される
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 値を反映する
    [self.delegate tableViewControllerDelegateDidFinish:[NSString stringWithFormat:@"項目 %d", indexPath.row]];
}


/* ============================================================================== */
#pragma mark - Button Action
/* ============================================================================== */
- (void)rightBarBtnItmAction:(UIButton*)sender
{
    //
}


@end
