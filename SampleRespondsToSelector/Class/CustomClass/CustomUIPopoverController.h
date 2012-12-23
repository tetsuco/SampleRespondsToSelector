//
//  CustomUIPopoverController.h
//  SampleRespondsToSelector
//
//  Created by  on 11/12/18.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "objc/runtime.h"

@interface UIPopoverController(Add)


/* メソッド */

- (BOOL)respondsToSelector:(SEL)aSelector;


@end