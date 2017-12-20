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

@end

@implementation WPSearchBar

- (instancetype)initWithFrame:(CGRect)frame leftIcon:(UIImage *)leftIcon rightIcon:(UIImage *)rightIcon {
    self = [super initWithFrame:frame];
    if (self) {
        _searchBarFrame = frame;
        _barLeftIcon = [[UIImageView alloc] init];
        if (!leftIcon) {
            _barLeftIcon.frame = CGRectZero;
        } else {
            _barLeftIcon.image = leftIcon;
            _barLeftIcon.frame = CGRectMake(0, CGRectGetMidY(self.bounds) - 12, 24, 24);
            _barLeftIcon.contentMode = UIViewContentModeScaleAspectFit;
        }
        [self addSubview:_barLeftIcon];
        
        _barRightIcon = [[UIImageView alloc] init];
        
        if (!rightIcon) {
            _barRightIcon.frame = CGRectZero;
        } else {
            _barRightIcon.image = rightIcon;
            _barRightIcon.frame = CGRectMake(self.wpViewWidth - 24, CGRectGetMidY(self.bounds) - 12, 24, 24);
            _barRightIcon.contentMode = UIViewContentModeScaleAspectFit;
        }
        [self addSubview:_barRightIcon];
        
        _barTextField = [[WPSearchBarTextField alloc] initWithFrame:CGRectMake(_barLeftIcon.wpViewMaxX, 5, self.wpViewWidth - _barLeftIcon.wpViewWidth - _barRightIcon.wpViewWidth, self.wpViewHeight)];
        _barTextField.delegate = self;
        [self addSubview:_barTextField];
        
    }
    return self;
}

/**
 初始化创建方法
 
 @param frame 试图的位置
 @param leftImage 左边的icon
 @param rightImage 右边的icon
 @return WPSearchBar 对象
 */
+ (WPSearchBar *)initTheSearchBarWithFrame:(CGRect)frame leftViewImage:(UIImage *)leftImage rightViewImage:(UIImage *)rightImage {
    WPSearchBar *searchBar = [[WPSearchBar alloc] initWithFrame:frame leftIcon:leftImage rightIcon:rightImage];
    return searchBar;
}


#pragma mark Setter and Getter


#pragma mark - UITextFieldDelegate 
/*
- (void)wpSearchBarTextDidBeginEditing:(WPSearchBar *)searchBar; 

- (void)wpSearchBarTextDidEndEditing:(WPSearchBar *)searchBar;  

- (void)wpSearchBar:(WPSearchBar *)searchBar textDidChange:(NSString *)searchText; 

- (BOOL)wpSearchBar:(WPSearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

- (void)wpSearchBarSearchButtonClicked:(WPSearchBar *)searchBar;   
 */

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}




@end
