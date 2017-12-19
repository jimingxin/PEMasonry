//
//  UIView+MASShorthandAdditions.h
//  Masonry
//
//  Created by Jonas Budelmann on 22/07/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "View+PEMASAdditions.h"

#ifdef MAS_SHORTHAND

/**
 *	Shorthand view additions without the 'mas_' prefixes,
 *  only enabled if MAS_SHORTHAND is defined
 */
@interface MAS_VIEW (PEMASShorthandAdditions)

@property (nonatomic, strong, readonly) PEMASViewAttribute *left;
@property (nonatomic, strong, readonly) PEMASViewAttribute *top;
@property (nonatomic, strong, readonly) PEMASViewAttribute *right;
@property (nonatomic, strong, readonly) PEMASViewAttribute *bottom;
@property (nonatomic, strong, readonly) PEMASViewAttribute *leading;
@property (nonatomic, strong, readonly) PEMASViewAttribute *trailing;
@property (nonatomic, strong, readonly) PEMASViewAttribute *width;
@property (nonatomic, strong, readonly) PEMASViewAttribute *height;
@property (nonatomic, strong, readonly) PEMASViewAttribute *centerX;
@property (nonatomic, strong, readonly) PEMASViewAttribute *centerY;
@property (nonatomic, strong, readonly) PEMASViewAttribute *baseline;
@property (nonatomic, strong, readonly) PEMASViewAttribute *(^attribute)(NSLayoutAttribute attr);

@property (nonatomic, strong, readonly) PEMASViewAttribute *firstBaseline;
@property (nonatomic, strong, readonly) PEMASViewAttribute *lastBaseline;

#if TARGET_OS_IPHONE || TARGET_OS_TV

@property (nonatomic, strong, readonly) PEMASViewAttribute *leftMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *rightMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *topMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *bottomMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *leadingMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *trailingMargin;
@property (nonatomic, strong, readonly) PEMASViewAttribute *centerXWithinMargins;
@property (nonatomic, strong, readonly) PEMASViewAttribute *centerYWithinMargins;

#endif

#if TARGET_OS_IPHONE || TARGET_OS_TV

@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideLeading NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideTrailing NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideLeft NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideRight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideTop NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideBottom NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideWidth NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideHeight NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideCenterX NS_AVAILABLE_IOS(11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *safeAreaLayoutGuideCenterY NS_AVAILABLE_IOS(11.0);

#endif

- (NSArray *)makeConstraints:(void(^)(MASConstraintMaker *make))block;
- (NSArray *)updateConstraints:(void(^)(MASConstraintMaker *make))block;
- (NSArray *)remakeConstraints:(void(^)(MASConstraintMaker *make))block;

@end

#define MAS_ATTR_FORWARD(attr)  \
- (PEMASViewAttribute *)attr {    \
    return [self mas_##attr];   \
}

#define MAS_ATTR_FORWARD_AVAILABLE(attr, available)  \
- (PEMASViewAttribute *)attr available {    \
    return [self mas_##attr];   \
}

@implementation MAS_VIEW (MASShorthandAdditions)

MAS_ATTR_FORWARD(top);
MAS_ATTR_FORWARD(left);
MAS_ATTR_FORWARD(bottom);
MAS_ATTR_FORWARD(right);
MAS_ATTR_FORWARD(leading);
MAS_ATTR_FORWARD(trailing);
MAS_ATTR_FORWARD(width);
MAS_ATTR_FORWARD(height);
MAS_ATTR_FORWARD(centerX);
MAS_ATTR_FORWARD(centerY);
MAS_ATTR_FORWARD(baseline);

MAS_ATTR_FORWARD(firstBaseline);
MAS_ATTR_FORWARD(lastBaseline);

#if TARGET_OS_IPHONE || TARGET_OS_TV

MAS_ATTR_FORWARD(leftMargin);
MAS_ATTR_FORWARD(rightMargin);
MAS_ATTR_FORWARD(topMargin);
MAS_ATTR_FORWARD(bottomMargin);
MAS_ATTR_FORWARD(leadingMargin);
MAS_ATTR_FORWARD(trailingMargin);
MAS_ATTR_FORWARD(centerXWithinMargins);
MAS_ATTR_FORWARD(centerYWithinMargins);

MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideLeading, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideTrailing, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideLeft, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideRight, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideTop, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideBottom, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideWidth, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideHeight, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideCenterX, NS_AVAILABLE_IOS(11.0));
MAS_ATTR_FORWARD_AVAILABLE(safeAreaLayoutGuideCenterY, NS_AVAILABLE_IOS(11.0));

#endif

- (PEMASViewAttribute *(^)(NSLayoutAttribute))attribute {
    return [self mas_attribute];
}

- (NSArray *)makeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *))block {
    return [self mas_makeConstraints:block];
}

- (NSArray *)updateConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *))block {
    return [self mas_updateConstraints:block];
}

- (NSArray *)remakeConstraints:(void(NS_NOESCAPE ^)(MASConstraintMaker *))block {
    return [self mas_remakeConstraints:block];
}

@end

#endif
