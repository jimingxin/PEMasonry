//
//  UIViewController+MASAdditions.m
//  Masonry
//
//  Created by Craig Siemens on 2015-06-23.
//
//

#import "ViewController+PEMASAdditions.h"

#ifdef MAS_VIEW_CONTROLLER

@implementation MAS_VIEW_CONTROLLER (PEMASAdditions)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

- (PEMASViewAttribute *)mas_topLayoutGuide {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.topLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}
- (PEMASViewAttribute *)mas_topLayoutGuideTop {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.topLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (PEMASViewAttribute *)mas_topLayoutGuideBottom {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.topLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

- (PEMASViewAttribute *)mas_bottomLayoutGuide {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (PEMASViewAttribute *)mas_bottomLayoutGuideTop {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeTop];
}
- (PEMASViewAttribute *)mas_bottomLayoutGuideBottom {
    return [[PEMASViewAttribute alloc] initWithView:self.view item:self.bottomLayoutGuide layoutAttribute:NSLayoutAttributeBottom];
}

#pragma clang diagnostic pop

@end

#endif
