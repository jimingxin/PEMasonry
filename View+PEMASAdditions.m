//
//  UIView+MASAdditions.m
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "View+PEMASAdditions.h"
#import <objc/runtime.h>

@implementation MAS_VIEW (PEMASAdditions)

- (NSArray *)mas_makeConstraints:(void(^)(PEMASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    PEMASConstraintMaker *constraintMaker = [[PEMASConstraintMaker alloc] initWithView:self];
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_updateConstraints:(void(^)(PEMASConstraintMaker *))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    PEMASConstraintMaker *constraintMaker = [[PEMASConstraintMaker alloc] initWithView:self];
    constraintMaker.updateExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

- (NSArray *)mas_remakeConstraints:(void(^)(PEMASConstraintMaker *make))block {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    PEMASConstraintMaker *constraintMaker = [[PEMASConstraintMaker alloc] initWithView:self];
    constraintMaker.removeExisting = YES;
    block(constraintMaker);
    return [constraintMaker install];
}

#pragma mark - NSLayoutAttribute properties

- (PEMASViewAttribute *)mas_left {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeft];
}

- (PEMASViewAttribute *)mas_top {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
}

- (PEMASViewAttribute *)mas_right {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRight];
}

- (PEMASViewAttribute *)mas_bottom {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottom];
}

- (PEMASViewAttribute *)mas_leading {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeading];
}

- (PEMASViewAttribute *)mas_trailing {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailing];
}

- (PEMASViewAttribute *)mas_width {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeWidth];
}

- (PEMASViewAttribute *)mas_height {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeHeight];
}

- (PEMASViewAttribute *)mas_centerX {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterX];
}

- (PEMASViewAttribute *)mas_centerY {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterY];
}

- (PEMASViewAttribute *)mas_baseline {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBaseline];
}

- (PEMASViewAttribute *(^)(NSLayoutAttribute))mas_attribute
{
    return ^(NSLayoutAttribute attr) {
        return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:attr];
    };
}

- (PEMASViewAttribute *)mas_firstBaseline {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeFirstBaseline];
}
- (PEMASViewAttribute *)mas_lastBaseline {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLastBaseline];
}

#if TARGET_OS_IPHONE || TARGET_OS_TV

- (PEMASViewAttribute *)mas_leftMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeftMargin];
}

- (PEMASViewAttribute *)mas_rightMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeRightMargin];
}

- (PEMASViewAttribute *)mas_topMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTopMargin];
}

- (PEMASViewAttribute *)mas_bottomMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeBottomMargin];
}

- (PEMASViewAttribute *)mas_leadingMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (PEMASViewAttribute *)mas_trailingMargin {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (PEMASViewAttribute *)mas_centerXWithinMargins {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (PEMASViewAttribute *)mas_centerYWithinMargins {
    return [[PEMASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuide {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeNotAnAttribute];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideLeading {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeading];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideTrailing {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTrailing];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideLeft {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeLeft];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideRight {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeRight];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideTop {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideBottom {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideWidth {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeWidth];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideHeight {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeHeight];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideCenterX {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterX];
}

- (PEMASViewAttribute *)mas_safeAreaLayoutGuideCenterY {
    return [[PEMASViewAttribute alloc] initWithView:self item:self.safeAreaLayoutGuide layoutAttribute:NSLayoutAttributeCenterY];
}

#endif

#pragma mark - associated properties

- (id)mas_key {
    return objc_getAssociatedObject(self, @selector(mas_key));
}

- (void)setMas_key:(id)key {
    objc_setAssociatedObject(self, @selector(mas_key), key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - heirachy

- (instancetype)mas_closestCommonSuperview:(MAS_VIEW *)view {
    MAS_VIEW *closestCommonSuperview = nil;

    MAS_VIEW *secondViewSuperview = view;
    while (!closestCommonSuperview && secondViewSuperview) {
        MAS_VIEW *firstViewSuperview = self;
        while (!closestCommonSuperview && firstViewSuperview) {
            if (secondViewSuperview == firstViewSuperview) {
                closestCommonSuperview = secondViewSuperview;
            }
            firstViewSuperview = firstViewSuperview.superview;
        }
        secondViewSuperview = secondViewSuperview.superview;
    }
    return closestCommonSuperview;
}

@end
