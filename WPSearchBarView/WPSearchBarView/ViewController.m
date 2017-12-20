//
//  ViewController.m
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import "ViewController.h"
#import "WPSearchBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WPSearchBar *searchBar = [WPSearchBar initTheSearchBarWithFrame:CGRectMake(10, 80, 355, 44) leftViewImage:@"pl" rightViewImage:@"wx"];
    searchBar.backgroundColor = [UIColor cyanColor];
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.frame = CGRectMake(0, 0, 44, 34);
    clickButton.backgroundColor = [UIColor redColor];
    searchBar.barSearchButton = clickButton;
    searchBar.barPlaceHolder = @"请输入信息";
    searchBar.barContentFont = [UIFont systemFontOfSize:12];
    searchBar.clearContentModel = WPSearchBarContentModeWhileEditing;
    [self.view addSubview:searchBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
