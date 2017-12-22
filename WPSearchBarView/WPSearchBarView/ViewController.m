//
//  ViewController.m
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import "ViewController.h"
#import "WPSearchBar.h"

@interface ViewController ()<WPSearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WPSearchBar *searchBar = [WPSearchBar initTheSearchBarWithFrame:CGRectMake(10, 80, 355, 44) leftViewImage:@"pl" rightViewImage:@"wx"];
    searchBar.backgroundColor = [UIColor cyanColor];
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.frame = CGRectMake(0, 0, 44, 34);
    clickButton.backgroundColor = [UIColor purpleColor];
    [clickButton setTitle:@"搜索" forState:UIControlStateNormal];
    clickButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [clickButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    searchBar.barSearchButton = clickButton;
    searchBar.barPlaceHolder = @"请输入信息";
    searchBar.barContentFont = [UIFont systemFontOfSize:12];
//    searchBar.searchBarDelegate = self;
    searchBar.clearContentModel = WPSearchBarContentModeWhileEditing;
    searchBar.wpSearchBarCornerRadius = 6;
    searchBar.wpSearchBarMainCornerRadius = 6;
    searchBar.wpSeachBarMainViewBackColor = [UIColor lightGrayColor];
    searchBar.wpSearchBarContentBackColor = [UIColor orangeColor];
    [searchBar addBarLeftBarViewTarget:self clickAction:@selector(clickLeft)];
    [searchBar addBarRightBarViewTarget:self clickAction:@selector(clickRight)];
    [searchBar wpSearchBarBeginEditing:^(WPSearchBar *searchBar) {
        NSLog(@"block 开始编辑");
    }];
    [searchBar wpSearchBarEndEditing:^(WPSearchBar *searchBar) {
        NSLog(@"block 结束编辑");
    }];
    
    [searchBar wpSearchBarShouldEdit:^BOOL(WPSearchBar *searchBar, NSRange range, NSString *text) {
        NSLog(@"block 是否能够编辑");
        return YES;
    }];
    
    [searchBar wpSearchBarClickSearchInfo:^(WPSearchBar *searchBar) {
        NSLog(@"block 点击搜索");
    }];
    
    [searchBar wpSearchBarClearInfo:^(WPSearchBar *searchBar) {
        NSLog(@"block 清空按钮");
    }];
    [self.view addSubview:searchBar];
}

#pragma mark WPSearchBarDelegate
- (void)wpSearchBarTextDidEndEditing:(WPSearchBar *)searchBar {
    NSLog(@"结束编辑");
}

- (void)wpSearchBarSearchButtonClicked:(WPSearchBar *)searchBar {
    NSLog(@"点击搜索");
}

- (void)wpSearchBarClickClearInfoButton:(WPSearchBar *)searchBar {
    NSLog(@"点击清空");
}

- (void)clickLeft {
    NSLog(@"点击左边图标");
}

- (void)clickRight {
    NSLog(@"点击右边的图标");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
