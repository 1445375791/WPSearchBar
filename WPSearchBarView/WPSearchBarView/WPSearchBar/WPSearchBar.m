//
//  WPSearchBar.m
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import "WPSearchBar.h"
#import "UIView+WPVFramePropty.h"

@interface WPSearchBar()

/**
 视图的frame
 */
@property(nonatomic, assign) CGRect searchBarFrame;

/**
 输入框
 */
@property (nonatomic, strong) UITextField *barTextField;

@end

@implementation WPSearchBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _searchBarFrame = frame;
        _barTextField = [[UITextField alloc] init];
    }
    return self;
}

/**
 初始化创建方法
 
 @param frame 试图的位置
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame {
    WPSearchBar *searchBar = [[WPSearchBar alloc] initWithFrame:frame];
    return searchBar;
}

@end
