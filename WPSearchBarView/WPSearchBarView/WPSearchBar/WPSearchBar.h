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
 支持Delegate 和Block方法 
 如果代理和block都存在的话 优先执行delegate方法  如果代理方法没有 block有实现 则执行block的方法
 */

typedef NS_ENUM(NSInteger, WPSearchBarContentMode) {
    WPSearchBarContentModeNever,
    WPSearchBarContentModeWhileEditing,
    WPSearchBarContentModeUnlessEditing,
    WPSearchBarContentModeAlways
};

@class WPSearchBar;
/**
 开始编辑的block
 
 @param searchBar searchBar
 */
typedef void(^BarDidBeginEditingBlock)(WPSearchBar *searchBar);

/**
 结束编辑
 
 @param searchBar searchBar
 */
typedef void(^BarDidEndEditingBlock)(WPSearchBar *searchBar);

/**
 是否允许改变输入
 
 @param searchBar searchBar
 @param range range
 @param text text
 @return YES NO
 */
typedef BOOL(^BarShouldChangeInfoBlock)(WPSearchBar *searchBar, NSRange range, NSString *text);

/**
 点击搜索按钮的block
 
 @param searchBar searchBar
 */
typedef void(^BarSearchClickBlock)(WPSearchBar *searchBar);

/**
 清空信息的Block
 
 @param searchBar searchBar
 */
typedef void(^BarClickClearBlock)(WPSearchBar *searchBar);

@protocol WPSearchBarDelegate;

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
 搜索框右边点击操作按钮  不需要给此视图添加执行方法 工具中自动添加执行方法
 */
@property (nonatomic, strong) UIButton *barSearchButton;

/**
 占位文字
 */
@property (nonatomic, copy) NSString *barPlaceHolder;

/**
 输入框搜索文字
 */
@property (nonatomic, copy) NSString *barSearchInfoContent;

/**
 代理方法
 */
@property (nonatomic, weak) id<WPSearchBarDelegate> searchBarDelegate;

/**
 输入框文字字体
 */
@property (nonatomic, strong) UIFont *barContentFont;

/**
 输入框后出现的清除按钮样式
 */
@property (nonatomic, assign) WPSearchBarContentMode clearContentModel;

/**
 键盘点击回车键是否能够注销键盘
 default YES  能够自动回收键盘
 */
@property (nonatomic, assign) BOOL barKeyBoardReturnKeyCanDismiss;

/**
 开始编辑block
 */
@property (nonatomic, copy) BarDidBeginEditingBlock beginEditingBlock;

/**
 结束编辑
 */
@property (nonatomic, copy) BarDidEndEditingBlock endEditingBlock;

/**
 是否允许改变
 */
@property (nonatomic, copy) BarShouldChangeInfoBlock shouldChangeBlock;

/**
 点击搜索按钮
 */
@property (nonatomic, copy) BarSearchClickBlock clickSearchBlock;

/**
 点击清空按钮
 */
@property (nonatomic, copy) BarClickClearBlock clickClearBlock;

/**
 视图切圆角
 */
@property (nonatomic, assign) CGFloat wpSearchBarCornerRadius;

/**
 视图整体背景色
 */
@property (nonatomic, strong) UIColor *wpSearchBarAllBackColor;

/**
 输入框背景颜色
 */
@property (nonatomic, strong) UIColor *wpSearchBarContentBackColor;

/**
 搜索按钮左边视图背景
 */
@property (nonatomic, strong) UIColor *wpSeachBarMainViewBackColor;

/**
 搜索主体圆角
 */
@property (nonatomic, assign) CGFloat wpSearchBarMainCornerRadius;

/**
 初始化创建方法
 
 @param frame 试图的位置
 @param leftImageName 左边的icon
 @param rightImageName 右边的icon
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame leftViewImage:(NSString *)leftImageName rightViewImage:(NSString *)rightImageName;

/**
 给输入框左边图标添加点击事件

 @param target 目标对象
 @param clickMethod 执行的方法
 */
- (void)addBarLeftBarViewTarget:(id)target clickAction:(SEL)clickMethod;

/**
 给输入框右边的图标添加点击事件

 @param target 目标对象
 @param clickMethod 执行的方法
 */
- (void)addBarRightBarViewTarget:(id)target clickAction:(SEL)clickMethod;

/**
 开始编辑方法

 @param beginEditingBlock beginEditingBlock
 */
- (void)wpSearchBarBeginEditing:(BarDidBeginEditingBlock)beginEditingBlock;

/**
 结束编辑

 @param endEditingBlock endEditingBlock
 */
- (void)wpSearchBarEndEditing:(BarDidEndEditingBlock)endEditingBlock;

/**
 是否可以改变文字

 @param shouldEditingBlock shouldEditingBlock
 */
- (void)wpSearchBarShouldEdit:(BarShouldChangeInfoBlock)shouldEditingBlock;

/**
 点击搜索按钮

 @param searchClickBlock searchClickBlock
 */
- (void)wpSearchBarClickSearchInfo:(BarSearchClickBlock)searchClickBlock;

/**
 点击清空内容

 @param clearBlock clearBlock
 */
- (void)wpSearchBarClearInfo:(BarClickClearBlock)clearBlock;


@end


/**
 WPSearchBar的代理方法
 */
@protocol WPSearchBarDelegate <NSObject>

@optional

/**
 搜索框开始编辑

 @param searchBar searchBar
 */
- (void)wpSearchBarTextDidBeginEditing:(WPSearchBar *)searchBar; 

/**
 搜索框结束编辑

 @param searchBar searchBar
 */
- (void)wpSearchBarTextDidEndEditing:(WPSearchBar *)searchBar;  

/**
 搜索框内容改变

 @param searchBar searchBar
 @param searchText 改变的内容
 */
//- (void)wpSearchBar:(WPSearchBar *)searchBar textDidChange:(NSString *)searchText; 

/**
 是否允许搜索框文字改变 NO 不能改变 YES 能够改变

 @param searchBar searchBar
 @param range 范围
 @param text 内容
 @return NO YES
 */
- (BOOL)wpSearchBar:(WPSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

/**
 点击搜索按钮

 @param searchBar 对象
 */
- (void)wpSearchBarSearchButtonClicked:(WPSearchBar *)searchBar;

/**
 点击输入框中清楚按钮

 @param searchBar searchBar
 */
- (void)wpSearchBarClickClearInfoButton:(WPSearchBar *)searchBar;


@end


