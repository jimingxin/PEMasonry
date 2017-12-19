//
//  PEMASConstraint.m
//  Masonry
//
//  Created by Nick Tymchenko on 1/20/14.
//

#import "PEMASConstraint.h"
#import "PEMASConstraint+Private.h"

#define MASMethodNotImplemented() \
    @throw [NSException exceptionWithName:NSInternalInconsistencyException \
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)] \
                                 userInfo:nil]

@implementation PEMASConstraint

#pragma mark - Init

- (id)init {
	NSAssert(![self isMemberOfClass:[PEMASConstraint class]], @"PEMASConstraint is an abstract class, you should not instantiate it directly.");
	return [super init];
}

#pragma mark - NSLayoutRelation proxies

- (PEMASConstraint * (^)(id))equalTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (PEMASConstraint * (^)(id))mas_equalTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationEqual);
    };
}

- (PEMASConstraint * (^)(id))greaterThanOrEqualTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (PEMASConstraint * (^)(id))mas_greaterThanOrEqualTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationGreaterThanOrEqual);
    };
}

- (PEMASConstraint * (^)(id))lessThanOrEqualTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationLessThanOrEqual);
    };
}

- (PEMASConstraint * (^)(id))mas_lessThanOrEqualTo {
    return ^id(id attribute) {
        return self.equalToWithRelation(attribute, NSLayoutRelationLessThanOrEqual);
    };
}

#pragma mark - MASLayoutPriority proxies

- (PEMASConstraint * (^)(void))priorityLow {
    return ^id{
        self.priority(MASLayoutPriorityDefaultLow);
        return self;
    };
}

- (PEMASConstraint * (^)(void))priorityMedium {
    return ^id{
        self.priority(MASLayoutPriorityDefaultMedium);
        return self;
    };
}

- (PEMASConstraint * (^)(void))priorityHigh {
    return ^id{
        self.priority(MASLayoutPriorityDefaultHigh);
        return self;
    };
}

#pragma mark - NSLayoutConstraint constant proxies

- (PEMASConstraint * (^)(MASEdgeInsets))insets {
    return ^id(MASEdgeInsets insets){
        self.insets = insets;
        return self;
    };
}

- (PEMASConstraint * (^)(CGFloat))inset {
    return ^id(CGFloat inset){
        self.inset = inset;
        return self;
    };
}

- (PEMASConstraint * (^)(CGSize))sizeOffset {
    return ^id(CGSize offset) {
        self.sizeOffset = offset;
        return self;
    };
}

- (PEMASConstraint * (^)(CGPoint))centerOffset {
    return ^id(CGPoint offset) {
        self.centerOffset = offset;
        return self;
    };
}

- (PEMASConstraint * (^)(CGFloat))offset {
    return ^id(CGFloat offset){
        self.offset = offset;
        return self;
    };
}

- (PEMASConstraint * (^)(NSValue *value))valueOffset {
    return ^id(NSValue *offset) {
        NSAssert([offset isKindOfClass:NSValue.class], @"expected an NSValue offset, got: %@", offset);
        [self setLayoutConstantWithValue:offset];
        return self;
    };
}

- (PEMASConstraint * (^)(id offset))mas_offset {
    // Will never be called due to macro
    return nil;
}

#pragma mark - NSLayoutConstraint constant setter

- (void)setLayoutConstantWithValue:(NSValue *)value {
    if ([value isKindOfClass:NSNumber.class]) {
        self.offset = [(NSNumber *)value doubleValue];
    } else if (strcmp(value.objCType, @encode(CGPoint)) == 0) {
        CGPoint point;
        [value getValue:&point];
        self.centerOffset = point;
    } else if (strcmp(value.objCType, @encode(CGSize)) == 0) {
        CGSize size;
        [value getValue:&size];
        self.sizeOffset = size;
    } else if (strcmp(value.objCType, @encode(MASEdgeInsets)) == 0) {
        MASEdgeInsets insets;
        [value getValue:&insets];
        self.insets = insets;
    } else {
        NSAssert(NO, @"attempting to set layout constant with unsupported value: %@", value);
    }
}

#pragma mark - Semantic properties

- (PEMASConstraint *)with {
    return self;
}

- (PEMASConstraint *)and {
    return self;
}

#pragma mark - Chaining

- (PEMASConstraint *)addConstraintWithLayoutAttribute:(NSLayoutAttribute __unused)layoutAttribute {
    MASMethodNotImplemented();
}

- (PEMASConstraint *)left {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeft];
}

- (PEMASConstraint *)top {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTop];
}

- (PEMASConstraint *)right {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRight];
}

- (PEMASConstraint *)bottom {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottom];
}

- (PEMASConstraint *)leading {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeading];
}

- (PEMASConstraint *)trailing {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailing];
}

- (PEMASConstraint *)width {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeWidth];
}

- (PEMASConstraint *)height {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeHeight];
}

- (PEMASConstraint *)centerX {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterX];
}

- (PEMASConstraint *)centerY {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterY];
}

- (PEMASConstraint *)baseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBaseline];
}

- (PEMASConstraint *)firstBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeFirstBaseline];
}
- (PEMASConstraint *)lastBaseline {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLastBaseline];
}

#if TARGET_OS_IPHONE || TARGET_OS_TV

- (PEMASConstraint *)leftMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeftMargin];
}

- (PEMASConstraint *)rightMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeRightMargin];
}

- (PEMASConstraint *)topMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTopMargin];
}

- (PEMASConstraint *)bottomMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeBottomMargin];
}

- (PEMASConstraint *)leadingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeLeadingMargin];
}

- (PEMASConstraint *)trailingMargin {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeTrailingMargin];
}

- (PEMASConstraint *)centerXWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterXWithinMargins];
}

- (PEMASConstraint *)centerYWithinMargins {
    return [self addConstraintWithLayoutAttribute:NSLayoutAttributeCenterYWithinMargins];
}

#endif

#pragma mark - Abstract

- (PEMASConstraint * (^)(CGFloat multiplier))multipliedBy { MASMethodNotImplemented(); }

- (PEMASConstraint * (^)(CGFloat divider))dividedBy { MASMethodNotImplemented(); }

- (PEMASConstraint * (^)(PEMASLayoutPriority priority))priority { MASMethodNotImplemented(); }

- (PEMASConstraint * (^)(id, NSLayoutRelation))equalToWithRelation { MASMethodNotImplemented(); }

- (PEMASConstraint * (^)(id key))key { MASMethodNotImplemented(); }

- (void)setInsets:(MASEdgeInsets __unused)insets { MASMethodNotImplemented(); }

- (void)setInset:(CGFloat __unused)inset { MASMethodNotImplemented(); }

- (void)setSizeOffset:(CGSize __unused)sizeOffset { MASMethodNotImplemented(); }

- (void)setCenterOffset:(CGPoint __unused)centerOffset { MASMethodNotImplemented(); }

- (void)setOffset:(CGFloat __unused)offset { MASMethodNotImplemented(); }

#if TARGET_OS_MAC && !(TARGET_OS_IPHONE || TARGET_OS_TV)

- (PEMASConstraint *)animator { MASMethodNotImplemented(); }

#endif

- (void)activate { MASMethodNotImplemented(); }

- (void)deactivate { MASMethodNotImplemented(); }

- (void)install { MASMethodNotImplemented(); }

- (void)uninstall { MASMethodNotImplemented(); }

@end
