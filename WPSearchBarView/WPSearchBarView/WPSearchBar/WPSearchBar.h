//
//  WPSearchBar.h
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WPSearchBarDelegate;

/**
 本类继承与UIView 实现功能类似于UISearchBar的功能
 */
@interface WPSearchBar : UIView

/**
 WPSearchBar 左边视图 图标
 */
@property (nonatomic, strong) UIImageView *barLeftIcon;

/**
 右边视图图标
 */
@property (nonatomic, strong) UIImageView *barRightIcon;

/**
 占位文字
 */
@property (nonatomic, copy) NSString *barPlaceHolder;

/**
 代理方法
 */
@property (nonatomic, weak) id<WPSearchBarDelegate> searchBarDelegate;


/**
 初始化创建方法
 
 @param frame 试图的位置
 @param leftImage 左边的icon
 @param rightImage 右边的icon
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame leftViewImage:(UIImage *)leftImage rightViewImage:(UIImage *)rightImage;


@end


@protocol WPSearchBarDelegate <NSObject>

@optional

- (void)wpSearchBarTextDidBeginEditing:(WPSearchBar *)searchBar; 

- (void)wpSearchBarTextDidEndEditing:(WPSearchBar *)searchBar;  

- (void)wpSearchBar:(WPSearchBar *)searchBar textDidChange:(NSString *)searchText; 

- (BOOL)wpSearchBar:(WPSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

- (void)wpSearchBarSearchButtonClicked:(WPSearchBar *)searchBar;   

@end
