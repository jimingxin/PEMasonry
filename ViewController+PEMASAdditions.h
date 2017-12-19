//
//  UIViewController+MASAdditions.h
//  Masonry
//
//  Created by Craig Siemens on 2015-06-23.
//
//

#import "PEMASUtilities.h"
#import "PEMASConstraintMaker.h"
#import "PEMASViewAttribute.h"

#ifdef MAS_VIEW_CONTROLLER

@interface MAS_VIEW_CONTROLLER (PEMASAdditions)

/**
 *	following properties return a new MASViewAttribute with appropriate UILayoutGuide and NSLayoutAttribute
 */
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_topLayoutGuide NS_DEPRECATED_IOS(8.0, 11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_bottomLayoutGuide NS_DEPRECATED_IOS(8.0, 11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_topLayoutGuideTop NS_DEPRECATED_IOS(8.0, 11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_topLayoutGuideBottom NS_DEPRECATED_IOS(8.0, 11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_bottomLayoutGuideTop NS_DEPRECATED_IOS(8.0, 11.0);
@property (nonatomic, strong, readonly) PEMASViewAttribute *mas_bottomLayoutGuideBottom NS_DEPRECATED_IOS(8.0, 11.0);

@end

#endif
