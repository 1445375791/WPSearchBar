//
//  UIView+WPVFramePropty.h
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WPVFramePropty)

/**
 view的frame
 */
@property (nonatomic, assign) CGRect wpViewFrame;

/**
 view的bounds
 */
@property (nonatomic, assign) CGRect wpViewBounds;

/**
 view的size
 */
@property (nonatomic, assign) CGSize wpViewSize;

/**
 view的point
 */
@property (nonatomic, assign) CGPoint wpViewPoint;

/**
 view的中心point
 */
@property (nonatomic, assign) CGPoint wpViewCenterPoint;

/**
 view的x坐标
 */
@property (nonatomic, assign) CGFloat wpViewX;

/**
 view的y坐标
 */
@property (nonatomic, assign) CGFloat wpViewY;

/**
 view的宽
 */
@property (nonatomic, assign) CGFloat wpViewWidth;

/**
 view的高
 */
@property (nonatomic, assign) CGFloat wpViewHeight;

/**
 view的最小x
 */
@property (nonatomic, assign) CGFloat wpViewMinX;

/**
 view的中心X值
 */
@property (nonatomic, assign) CGFloat wpViewMidX;

/**
 view的最大X值
 */
@property (nonatomic, assign, readonly) CGFloat wpViewMaxX;

/**
 view的最小Y值
 */
@property (nonatomic, assign) CGFloat wpViewMinY;

/**
 view的中间Y值
 */
@property (nonatomic, assign) CGFloat wpViewMidY;

/**
 view的最大值
 */
@property (nonatomic, assign, readonly) CGFloat wpViewMaxY;


@end
