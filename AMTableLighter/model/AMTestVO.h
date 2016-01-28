//
//  AMTestVO.h
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AMTestVO : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic) CGFloat height;

- (instancetype)initWithTitle:(NSString *)aTitle
                       height:(CGFloat)aHeight;

@end
