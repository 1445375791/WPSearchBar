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
        _searchBackView.layer.borderColor = [UIColor blackColor].CGColor;
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



#pragma mark - UITextFieldDelegate 

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarTextDidBeginEditing:)]) {
        [self.searchBarDelegate wpSearchBarTextDidBeginEditing:self];
        return;
    }
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarTextDidEndEditing:)]) {
        [self.searchBarDelegate wpSearchBarTextDidEndEditing:self];
        return;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.searchBarDelegate) {
        if ([self.searchBarDelegate respondsToSelector:@selector(wpSearchBar:shouldChangeTextInRange:replacementText:)]) {
            return [self.searchBarDelegate wpSearchBar:self shouldChangeTextInRange:range replacementText:string];
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarClickClearInfoButton:)]) {
        [self.searchBarDelegate wpSearchBarClickClearInfoButton:self];
    }
    return YES;
}



- (void)searchBarClick {
    if (self.searchBarDelegate && [self.searchBarDelegate respondsToSelector:@selector(wpSearchBarSearchButtonClicked:)]) {
        [self.searchBarDelegate wpSearchBarSearchButtonClicked:self];
        return;
    }
}


@end
