//
//  AMTableDataDelegate.h
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef  UITableViewCell* (^CellConfigureBlock)(UITableView *tableView,  NSIndexPath *indexPath);
typedef  CGFloat (^CellHeightBlock)(NSIndexPath *indexPath, id item);
typedef  void (^CellDidSelectBlock)(NSIndexPath *indexPath, id item);
typedef  void (^CellWillDisplayBlock)(NSIndexPath *indexPath, id item, UITableViewCell *cell);
typedef  UIView* (^ViewForHeaderBlock)();

@interface AMTableDataDelegate : NSObject

- (instancetype)initWithItems:(NSArray *)aItems
           configureCellBlock:(CellConfigureBlock)aCellConfigureBlock
              cellHeightBlock:(CellHeightBlock)aCellHeightBlock
              cellWillDisplay:(CellWillDisplayBlock)aCellWillDisplayBlock
               didSelectBlock:(CellDidSelectBlock)aCellDidSelectBlock
           viewForHeaderBlock:(ViewForHeaderBlock)aViewForHeaderBlock
              heightForHeader:(CGFloat)aHeightForHeader;

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
