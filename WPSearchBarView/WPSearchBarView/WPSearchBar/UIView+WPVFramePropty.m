//
//  UIView+WPVFramePropty.m
//  WPSearchBarView
//
//  Created by 吴朋 on 2017/12/19.
//  Copyright © 2017年 wp. All rights reserved.
//

#import "UIView+WPVFramePropty.h"

@implementation UIView (WPVFramePropty)

#pragma mark Getter Method
// wpViewFrame
- (CGRect)wpViewFrame {
    return self.frame;
}

// wpViewBounds
- (CGRect)wpViewBounds {
    return self.bounds;
}

// wpViewSize
- (CGSize)wpViewSize {
    return self.wpViewFrame.size;
}

// wpViewPoint
- (CGPoint)wpViewPoint {
    return self.wpViewFrame.origin;
}

// wpViewCenterPoint
- (CGPoint)wpViewCenterPoint {
    return self.center;
}

// wpViewX
- (CGFloat)wpViewX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat)wpViewY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)wpViewWidth {
    return CGRectGetWidth(self.frame);
}

- (CGFloat)wpViewHeight {
    return CGRectGetHeight(self.frame);
}

- (CGFloat)wpViewMinX {
    return self.wpViewX;
}

- (CGFloat)wpViewMidX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)wpViewMaxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)wpViewMinY {
    return self.wpViewY;
}

- (CGFloat)wpViewMidY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)wpViewMaxY {
    return CGRectGetMaxY(self.frame);
}



#pragma mark Setter Method
// wpViewFrame
- (void)setWpViewFrame:(CGRect)wpViewFrame {
    self.frame = wpViewFrame;
}

// wpViewBounds
- (void)setWpViewBounds:(CGRect)wpViewBounds {
    self.bounds = wpViewBounds;
}

- (void)setWpViewSize:(CGSize)wpViewSize {
    CGRect frame = self.wpViewFrame;
    frame.size = wpViewSize;
    self.wpViewFrame = frame;
}

- (void)setWpViewPoint:(CGPoint)wpViewPoint {
    CGRect frame = self.wpViewFrame;
    frame.origin = wpViewPoint;
    self.wpViewFrame = frame;
}

- (void)setWpViewCenterPoint:(CGPoint)wpViewCenterPoint {
    self.center = wpViewCenterPoint;
}

- (void)setWpViewX:(CGFloat)wpViewX {
    CGRect frame = self.wpViewFrame;
    frame.origin.x = wpViewX;
    self.wpViewFrame = frame;
}

- (void)setWpViewY:(CGFloat)wpViewY {
    CGRect frame = self.wpViewFrame;
    frame.origin.y = wpViewY;
    self.wpViewFrame = frame;
}

- (void)setWpViewWidth:(CGFloat)wpViewWidth {
    CGRect frame = self.wpViewFrame;
    frame.size.width = wpViewWidth;
    self.wpViewFrame = frame;
}

- (void)setWpViewHeight:(CGFloat)wpViewHeight {
    CGRect frame = self.wpViewFrame;
    frame.size.height = wpViewHeight;
    self.wpViewFrame = frame;
}

- (void)setWpViewMinX:(CGFloat)wpViewMinX {
    self.wpViewX = wpViewMinX;
}

- (void)setWpViewMinY:(CGFloat)wpViewMinY {
    self.wpViewY = wpViewMinY;
}

- (void)setWpViewMidX:(CGFloat)wpViewMidX {
    CGPoint point = self.wpViewCenterPoint;
    point.x = wpViewMidX;
    self.wpViewCenterPoint = point;
}

- (void)setWpViewMidY:(CGFloat)wpViewMidY {
    CGPoint point = self.wpViewCenterPoint;
    point.y = wpViewMidY;
    self.wpViewCenterPoint = point;
}


@end
