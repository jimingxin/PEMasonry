//
//  NSArray+MASShorthandAdditions.h
//  Masonry
//
//  Created by Jonas Budelmann on 22/07/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "NSArray+PEMASAdditions.h"

#ifdef MAS_SHORTHAND

/**
 *	Shorthand array additions without the 'mas_' prefixes,
 *  only enabled if MAS_SHORTHAND is defined
 */
@interface NSArray (PEMASShorthandAdditions)

- (NSArray *)makeConstraints:(void(^)(PEMASConstraintMaker *make))block;
- (NSArray *)updateConstraints:(void(^)(PEMASConstraintMaker *make))block;
- (NSArray *)remakeConstraints:(void(^)(PEMASConstraintMaker *make))block;

@end

@implementation NSArray (PEMASShorthandAdditions)

- (NSArray *)makeConstraints:(void(^)(PEMASConstraintMaker *))block {
    return [self mas_makeConstraints:block];
}

- (NSArray *)updateConstraints:(void(^)(PEMASConstraintMaker *))block {
    return [self mas_updateConstraints:block];
}

- (NSArray *)remakeConstraints:(void(^)(PEMASConstraintMaker *))block {
    return [self mas_remakeConstraints:block];
}

@end

#endif
