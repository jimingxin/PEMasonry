//
//  MASConstraintMaker.h
//  Masonry
//
//  Created by Jonas Budelmann on 20/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "PEMASConstraint.h"
#import "PEMASUtilities.h"

typedef NS_OPTIONS(NSInteger, MASAttribute) {
    MASAttributeLeft = 1 << NSLayoutAttributeLeft,
    MASAttributeRight = 1 << NSLayoutAttributeRight,
    MASAttributeTop = 1 << NSLayoutAttributeTop,
    MASAttributeBottom = 1 << NSLayoutAttributeBottom,
    MASAttributeLeading = 1 << NSLayoutAttributeLeading,
    MASAttributeTrailing = 1 << NSLayoutAttributeTrailing,
    MASAttributeWidth = 1 << NSLayoutAttributeWidth,
    MASAttributeHeight = 1 << NSLayoutAttributeHeight,
    MASAttributeCenterX = 1 << NSLayoutAttributeCenterX,
    MASAttributeCenterY = 1 << NSLayoutAttributeCenterY,
    MASAttributeBaseline = 1 << NSLayoutAttributeBaseline,

    MASAttributeFirstBaseline = 1 << NSLayoutAttributeFirstBaseline,
    MASAttributeLastBaseline = 1 << NSLayoutAttributeLastBaseline,
    
#if TARGET_OS_IPHONE || TARGET_OS_TV
    
    MASAttributeLeftMargin = 1 << NSLayoutAttributeLeftMargin,
    MASAttributeRightMargin = 1 << NSLayoutAttributeRightMargin,
    MASAttributeTopMargin = 1 << NSLayoutAttributeTopMargin,
    MASAttributeBottomMargin = 1 << NSLayoutAttributeBottomMargin,
    MASAttributeLeadingMargin = 1 << NSLayoutAttributeLeadingMargin,
    MASAttributeTrailingMargin = 1 << NSLayoutAttributeTrailingMargin,
    MASAttributeCenterXWithinMargins = 1 << NSLayoutAttributeCenterXWithinMargins,
    MASAttributeCenterYWithinMargins = 1 << NSLayoutAttributeCenterYWithinMargins,

#endif
    
};

/**
 *  Provides factory methods for creating PEMASConstraints.
 *  Constraints are collected until they are ready to be installed
 *
 */
@interface PEMASConstraintMaker : NSObject

/**
 *	The following properties return a new MASViewConstraint
 *  with the first item set to the makers associated view and the appropriate MASViewAttribute
 */
@property (nonatomic, strong, readonly) PEMASConstraint *left;
@property (nonatomic, strong, readonly) PEMASConstraint *top;
@property (nonatomic, strong, readonly) PEMASConstraint *right;
@property (nonatomic, strong, readonly) PEMASConstraint *bottom;
@property (nonatomic, strong, readonly) PEMASConstraint *leading;
@property (nonatomic, strong, readonly) PEMASConstraint *trailing;
@property (nonatomic, strong, readonly) PEMASConstraint *width;
@property (nonatomic, strong, readonly) PEMASConstraint *height;
@property (nonatomic, strong, readonly) PEMASConstraint *centerX;
@property (nonatomic, strong, readonly) PEMASConstraint *centerY;
@property (nonatomic, strong, readonly) PEMASConstraint *baseline;

@property (nonatomic, strong, readonly) PEMASConstraint *firstBaseline;
@property (nonatomic, strong, readonly) PEMASConstraint *lastBaseline;

#if TARGET_OS_IPHONE || TARGET_OS_TV

@property (nonatomic, strong, readonly) PEMASConstraint *leftMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *rightMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *topMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *bottomMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *leadingMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *trailingMargin;
@property (nonatomic, strong, readonly) PEMASConstraint *centerXWithinMargins;
@property (nonatomic, strong, readonly) PEMASConstraint *centerYWithinMargins;

#endif

/**
 *  Returns a block which creates a new MASCompositeConstraint with the first item set
 *  to the makers associated view and children corresponding to the set bits in the
 *  MASAttribute parameter. Combine multiple attributes via binary-or.
 */
@property (nonatomic, strong, readonly) PEMASConstraint *(^attributes)(MASAttribute attrs);

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeEdges
 *  which generates the appropriate MASViewConstraint children (top, left, bottom, right)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) PEMASConstraint *edges;

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeSize
 *  which generates the appropriate MASViewConstraint children (width, height)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) PEMASConstraint *size;

/**
 *	Creates a MASCompositeConstraint with type MASCompositeConstraintTypeCenter
 *  which generates the appropriate MASViewConstraint children (centerX, centerY)
 *  with the first item set to the makers associated view
 */
@property (nonatomic, strong, readonly) PEMASConstraint *center;

/**
 *  Whether or not to check for an existing constraint instead of adding constraint
 */
@property (nonatomic, assign) BOOL updateExisting;

/**
 *  Whether or not to remove existing constraints prior to installing
 */
@property (nonatomic, assign) BOOL removeExisting;

/**
 *	initialises the maker with a default view
 *
 *	@param	view	any PEMASConstraint are created with this view as the first item
 *
 *	@return	a new PEMASConstraintMaker
 */
- (id)initWithView:(MAS_VIEW *)view;

/**
 *	Calls install method on any PEMASConstraints which have been created by this maker
 *
 *	@return	an array of all the installed PEMASConstraints
 */
- (NSArray *)install;

- (PEMASConstraint * (^)(dispatch_block_t))group;

@end
