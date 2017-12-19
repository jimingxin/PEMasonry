//
//  MASCompositeConstraint.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "PEMASCompositeConstraint.h"
#import "PEMASConstraint+Private.h"

@interface PEMASCompositeConstraint () <MASConstraintDelegate>

@property (nonatomic, strong) id mas_key;
@property (nonatomic, strong) NSMutableArray *childConstraints;

@end

@implementation PEMASCompositeConstraint

- (id)initWithChildren:(NSArray *)children {
    self = [super init];
    if (!self) return nil;

    _childConstraints = [children mutableCopy];
    for (PEMASConstraint *constraint in _childConstraints) {
        constraint.delegate = self;
    }

    return self;
}

#pragma mark - MASConstraintDelegate

- (void)constraint:(PEMASConstraint *)constraint shouldBeReplacedWithConstraint:(PEMASConstraint *)replacementConstraint {
    NSUInteger index = [self.childConstraints indexOfObject:constraint];
    NSAssert(index != NSNotFound, @"Could not find constraint %@", constraint);
    [self.childConstraints replaceObjectAtIndex:index withObject:replacementConstraint];
}

- (PEMASConstraint *)constraint:(PEMASConstraint __unused *)constraint addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    id<MASConstraintDelegate> strongDelegate = self.delegate;
    PEMASConstraint *newConstraint = [strongDelegate constraint:self addConstraintWithLayoutAttribute:layoutAttribute];
    newConstraint.delegate = self;
    [self.childConstraints addObject:newConstraint];
    return newConstraint;
}

#pragma mark - NSLayoutConstraint multiplier proxies 

- (PEMASConstraint * (^)(CGFloat))multipliedBy {
    return ^id(CGFloat multiplier) {
        for (PEMASConstraint *constraint in self.childConstraints) {
            constraint.multipliedBy(multiplier);
        }
        return self;
    };
}

- (PEMASConstraint * (^)(CGFloat))dividedBy {
    return ^id(CGFloat divider) {
        for (PEMASConstraint *constraint in self.childConstraints) {
            constraint.dividedBy(divider);
        }
        return self;
    };
}

#pragma mark - MASLayoutPriority proxy

- (PEMASConstraint * (^)(PEMASLayoutPriority))priority {
    return ^id(PEMASLayoutPriority priority) {
        for (PEMASConstraint *constraint in self.childConstraints) {
            constraint.priority(priority);
        }
        return self;
    };
}

#pragma mark - NSLayoutRelation proxy

- (PEMASConstraint * (^)(id, NSLayoutRelation))equalToWithRelation {
    return ^id(id attr, NSLayoutRelation relation) {
        for (PEMASConstraint *constraint in self.childConstraints.copy) {
            constraint.equalToWithRelation(attr, relation);
        }
        return self;
    };
}

#pragma mark - attribute chaining

- (PEMASConstraint *)addConstraintWithLayoutAttribute:(NSLayoutAttribute)layoutAttribute {
    [self constraint:self addConstraintWithLayoutAttribute:layoutAttribute];
    return self;
}

#pragma mark - Animator proxy

#if TARGET_OS_MAC && !(TARGET_OS_IPHONE || TARGET_OS_TV)

- (PEMASConstraint *)animator {
    for (PEMASConstraint *constraint in self.childConstraints) {
        [constraint animator];
    }
    return self;
}

#endif

#pragma mark - debug helpers

- (PEMASConstraint * (^)(id))key {
    return ^id(id key) {
        self.mas_key = key;
        int i = 0;
        for (PEMASConstraint *constraint in self.childConstraints) {
            constraint.key([NSString stringWithFormat:@"%@[%d]", key, i++]);
        }
        return self;
    };
}

#pragma mark - NSLayoutConstraint constant setters

- (void)setInsets:(MASEdgeInsets)insets {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.insets = insets;
    }
}

- (void)setInset:(CGFloat)inset {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.inset = inset;
    }
}

- (void)setOffset:(CGFloat)offset {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.offset = offset;
    }
}

- (void)setSizeOffset:(CGSize)sizeOffset {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.sizeOffset = sizeOffset;
    }
}

- (void)setCenterOffset:(CGPoint)centerOffset {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.centerOffset = centerOffset;
    }
}

#pragma mark - MASConstraint

- (void)activate {
    for (PEMASConstraint *constraint in self.childConstraints) {
        [constraint activate];
    }
}

- (void)deactivate {
    for (PEMASConstraint *constraint in self.childConstraints) {
        [constraint deactivate];
    }
}

- (void)install {
    for (PEMASConstraint *constraint in self.childConstraints) {
        constraint.updateExisting = self.updateExisting;
        [constraint install];
    }
}

- (void)uninstall {
    for (PEMASConstraint *constraint in self.childConstraints) {
        [constraint uninstall];
    }
}

@end
