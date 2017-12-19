//
//  WPSearchBar.h
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 本类继承与UIView 实现功能类似于UISearchBar的功能
 */
@interface WPSearchBar : UIView

/**
 WPSearchBar 左边视图 图标
 */
@property (nonatomic, strong) UIView *barLeftView;

/**
 右边视图图标
 */
@property (nonatomic, strong) UIView *barRightView;

/**
 占位文字
 */
@property (nonatomic, copy) NSString *barPlaceHolder;

/**
 初始化创建方法

 @param frame 试图的位置
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame;


@end
