//
//  WPSearchBar.m
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import "WPSearchBar.h"
#import "UIView+WPVFramePropty.h"
#import "WPSearchBarTextField.h"

@interface WPSearchBar()<UITextFieldDelegate>

/**
 视图的frame
 */
@property(nonatomic, assign) CGRect searchBarFrame;

/**
 输入框
 */
@property (nonatomic, strong) UITextField *barTextField;

/**
 输入框 图标背景视图
 */
@property (nonatomic, strong) UIView *searchBackView;

@end

@implementation WPSearchBar

- (instancetype)initWithFrame:(CGRect)frame leftIcon:(UIImage *)leftIcon rightIcon:(UIImage *)rightIcon {
    self = [super initWithFrame:frame];
    if (self) {
        _searchBarFrame = frame;
        _searchBackView = [[UIView alloc] initWithFrame:self.wpViewBounds];
        _searchBackView.layer.borderColor = [UIColor clearColor].CGColor;
        _searchBackView.layer.borderWidth = 0.5;
        [self addSubview:_searchBackView];
        CGFloat margin = 10;
        _barLeftIcon = [[UIImageView alloc] init];
        if (!leftIcon) {
            _barLeftIcon.frame = CGRectZero;
        } else {
            _barLeftIcon.image = leftIcon;
            _barLeftIcon.frame = CGRectMake(5, CGRectGetMidY(_searchBackView.bounds) - 12, 24, 24);
            _barLeftIcon.contentMode = UIViewContentModeScaleAspectFit;
            margin += 5;
        }
        [_searchBackView addSubview:_barLeftIcon];
        
        _barRightIcon = [[UIImageView alloc] init];
        
        if (!rightIcon) {
            _barRightIcon.frame = CGRectZero;
        } else {
            _barRightIcon.image = rightIcon;
            _barRightIcon.frame = CGRectMake(_searchBackView.wpViewWidth - 29, CGRectGetMidY(_searchBackView.bounds) - 12, 24, 24);
            _barRightIcon.contentMode = UIViewContentModeScaleAspectFit;
            margin += 5;
        }
        [_searchBackView addSubview:_barRightIcon];
        
        _barTextField = [[WPSearchBarTextField alloc] initWithFrame:CGRectMake(_barLeftIcon.wpViewMaxX + 5, 5, _searchBackView.wpViewWidth - _barLeftIcon.wpViewWidth - _barRightIcon.wpViewWidth - margin , _searchBackView.wpViewHeight - 10)];
        _barTextField.delegate = self;
        [_searchBackView addSubview:_barTextField];
        _barKeyBoardReturnKeyCanDismiss = YES;
        
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 3;
    }
    return self;
}

/**
 初始化创建方法
 
 @param frame 试图的位置
 @param leftImageName 左边的icon
 @param rightImageName 右边的icon
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame leftViewImage:(NSString *)leftImageName rightViewImage:(NSString *)rightImageName {
    UIImage *leftImage = nil;
    if (leftImageName && leftImageName.length > 0) {
        leftImage = [UIImage imageNamed:leftImageName];
    }
    UIImage *rightImage = nil;
    if (rightImageName && rightImageName.length > 0) {
        rightImage = [UIImage imageNamed:rightImageName];
    }
    
    WPSearchBar *searchBar = [[WPSearchBar alloc] initWithFrame:frame leftIcon:leftImage rightIcon:rightImage];
    return searchBar;
}

/**
 给输入框左边图标添加点击事件
 
 @param target 目标对象
 @param clickMethod 执行的方法
 */
- (void)addBarLeftBarViewTarget:(id)target clickAction:(SEL)clickMethod {
    [_barTextField resignFirstResponder];
    if (target && [target respondsToSelector:clickMethod]) {
        UITapGestureRecognizer *clickTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:clickMethod];
        _barLeftIcon.userInteractionEnabled = YES;
        [_barLeftIcon addGestureRecognizer:clickTap];
    }
}

/**
 给输入框右边的图标添加点击事件
 
 @param target 目标对象
 @param clickMethod 执行的方法
 */
- (void)addBarRightBarViewTarget:(id)target clickAction:(SEL)clickMethod {
    [_barTextField resignFirstResponder];
    if (target && [target respondsToSelector:clickMethod]) {
        UITapGestureRecognizer *clickTap = [[UITapGestureRecognizer alloc] initWithTarget:target action:clickMethod];
        _barRightIcon.userInteractionEnabled = YES;
        [_barRightIcon addGestureRecognizer:clickTap];
    }
}

/**
 开始编辑方法
 
 @param beginEditingBlock beginEditingBlock
 */
- (void)wpSearchBarBeginEditing:(BarDidBeginEditingBlock)beginEditingBlock {
    self.beginEditingBlock = beginEditingBlock;
}

/**
 结束编辑
 
 @param endEditingBlock endEditingBlock
 */
- (void)wpSearchBarEndEditing:(BarDidEndEditingBlock)endEditingBlock {
    self.endEditingBlock = endEditingBlock;
}

/**
 是否可以改变文字
 
 @param shouldEditingBlock shouldEditingBlock
 */
- (void)wpSearchBarShouldEdit:(BarShouldChangeInfoBlock)shouldEditingBlock {
    self.shouldChangeBlock = shouldEditingBlock;
}

/**
 点击搜索按钮
 
 @param searchClickBlock searchClickBlock
 */
- (void)wpSearchBarClickSearchInfo:(BarSearchClickBlock)searchClickBlock {
    self.clickSearchBlock = searchClickBlock;
}

/**
 点击清空内容
 
 @param clearBlock clearBlock
 */
- (void)wpSearchBarClearInfo:(BarClickClearBlock)clearBlock {
    self.clickClearBlock = clearBlock;
}


#pragma mark Setter and Getter

- (void)setBarPlaceHolder:(NSString *)barPlaceHolder {
    _barTextField.placeholder = barPlaceHolder;
    _barPlaceHolder = barPlaceHolder;
}

- (NSString *)barSearchInfoContent {
    return _barTextField.text;
}

- (void)setBarSearchButton:(UIButton *)barSearchButton {
    [barSearchButton addTarget:self action:@selector(searchBarClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:barSearchButton];
    if (barSearchButton.wpViewWidth > 40) {
        barSearchButton.wpViewWidth = 40;
    }
    barSearchButton.wpViewMidY = self.wpViewHeight / 2.0;
    CGFloat differMargin = barSearchButton.wpViewWidth + 15;
    barSearchButton.wpViewMinX = self.wpViewWidth - differMargin + 5;
    _searchBackView.wpViewWidth = self.wpViewWidth - differMargin;
    _barTextField.wpViewWidth -= differMargin;
    _barRightIcon.wpViewX = _barTextField.wpViewMaxX + 5;
    _barSearchButton = barSearchButton;
}

- (void)setBarContentFont:(UIFont *)barContentFont {
    _barTextField.font = barContentFont;
    _barContentFont = barContentFont;
}

- (void)setClearContentModel:(WPSearchBarContentMode)clearContentModel {
    UITextFieldViewMode viewModel = UITextFieldViewModeNever;
    switch (clearContentModel) {
        case WPSearchBarContentModeNever:
            viewModel = UITextFieldViewModeNever;
            break;
        case WPSearchBarContentModeWhileEditing:
            viewModel = UITextFieldViewModeWhileEditing;
            break;
        case WPSearchBarContentModeUnlessEditing:
            viewModel = UITextFieldViewModeUnlessEditing;
            break;
        case WPSearchBarContentModeAlways:
            viewModel = UITextFieldViewModeAlways;
            break;
    }
    _barTextField.clearButtonMode = viewModel;
}

/**
 视图切圆角
 */
- (void)setWpSearchBarCornerRadius:(CGFloat)wpSearchBarCornerRadius {
    self.layer.cornerRadius = wpSearchBarCornerRadius;
    self.clipsToBounds = YES;
    _wpSearchBarCornerRadius = wpSearchBarCornerRadius;
}

/**
 视图整体背景色
 */
- (void)setWpSearchBarAllBackColor:(UIColor *)wpSearchBarAllBackColor {
    self.backgroundColor = wpSearchBarAllBackColor;
    _wpSearchBarAllBackColor = wpSearchBarAllBackColor;
}

/**
 输入框背景颜色
 */
- (void)setWpSearchBarContentBackColor:(UIColor *)wpSearchBarContentBackColor {
    _barTextField.backgroundColor  = wpSearchBarContentBackColor;
    _wpSearchBarContentBackColor = wpSearchBarContentBackColor;
}

/**
 搜索按钮左边视图背景
 */
- (void)setWpSeachBarMainViewBackColor:(UIColor *)wpSeachBarMainViewBackColor {
    _searchBackView.backgroundColor = wpSeachBarMainViewBackColor;
    _wpSeachBarMainViewBackColor = wpSeachBarMainViewBackColor;
}

/**
 搜索主体圆角
 */
- (void)setWpSearchBarMainCornerRadius:(CGFloat)wpSearchBarMainCornerRadius {
    _searchBackView.layer.cornerRadius = wpSearchBarMainCornerRadius;
    _searchBackView.clipsToBounds = YES;
    _wpSearchBarMainCornerRadius = wpSearchBarMainCornerRadius;
}


#pragma mark - UITextFieldDelegate 
// 开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarTextDidEndEditing:)]) {
        [self.searchBarDelegate wpSearchBarTextDidEndEditing:self];
    } else {
        if (self.beginEditingBlock) {
            self.beginEditingBlock(self);
        }
    }
}

// 是否可以修改内容
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@"\n"] && _barKeyBoardReturnKeyCanDismiss) {
        [_barTextField resignFirstResponder];
        return NO;
    }
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBar:shouldChangeTextInRange:replacementText:)]) {
        return [self.searchBarDelegate wpSearchBar:self shouldChangeTextInRange:range replacementText:string];
    } else {
        if (self.shouldChangeBlock) {
            return self.shouldChangeBlock(self, range, string);
        } 
    }
    return YES;
}

// 是否可以清空
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarClickClearInfoButton:)]) {
        [self.searchBarDelegate wpSearchBarClickClearInfoButton:self];
    } else {
        if (self.clickClearBlock) {
            self.clickClearBlock(self);
        }
    }
    return YES;
}
    
// 结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarTextDidBeginEditing:)]) {
        [self.searchBarDelegate wpSearchBarTextDidBeginEditing:self];
    } else {
        if (self.endEditingBlock) {
            self.endEditingBlock(self);
        }
    }
}


/**
 点击搜索按钮
 */
- (void)searchBarClick {
    [_barTextField resignFirstResponder];
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarSearchButtonClicked:)]) {
        [self.searchBarDelegate wpSearchBarSearchButtonClicked:self];
    } else {
        if (self.clickSearchBlock) {
            self.clickSearchBlock(self);
        }
    }
}

- (void)dealloc
{
    _barTextField.delegate = nil;
}


@end
