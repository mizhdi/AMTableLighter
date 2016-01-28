//
//  AMTestVO.m
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import "AMTestVO.h"

@implementation AMTestVO

- (instancetype)initWithTitle:(NSString *)aTitle
                       height:(CGFloat)aHeight {
    if (self = [super init]) {
        self.title = aTitle;
        self.height = aHeight;
    }
    return self;
}

@end
