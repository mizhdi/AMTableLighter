//
//  AMTableDataDelegate.m
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import "AMTableDataDelegate.h"

@interface AMTableDataDelegate ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) CellConfigureBlock cellConfigureBlock;
@property (nonatomic, copy) CellHeightBlock cellHeightBlock;
@property (nonatomic, copy) CellDidSelectBlock cellDidSelectBlock;
@property (nonatomic, copy) ViewForHeaderBlock viewForHeaderBlock;
@property (nonatomic, copy) CellWillDisplayBlock aCellWillDisplayBlock;
@property (nonatomic) CGFloat heightForHeader;

@end

@implementation AMTableDataDelegate

- (instancetype)initWithItems:(NSArray *)aItems
           configureCellBlock:(CellConfigureBlock)aCellConfigureBlock
              cellHeightBlock:(CellHeightBlock)aCellHeightBlock
              cellWillDisplay:(CellWillDisplayBlock)aCellWillDisplayBlock
               didSelectBlock:(CellDidSelectBlock)aDidSelectBlock
           viewForHeaderBlock:(ViewForHeaderBlock)aViewForHeaderBlock
              heightForHeader:(CGFloat)aHeightForHeader {
    if (self = [super init]) {
        _items = aItems;
        _cellConfigureBlock = aCellConfigureBlock;
        _cellHeightBlock = aCellHeightBlock;
        _aCellWillDisplayBlock = aCellWillDisplayBlock;
        _cellDidSelectBlock = aDidSelectBlock;
        _viewForHeaderBlock = aViewForHeaderBlock;
        _heightForHeader = aHeightForHeader;
    }
    
    return self;
}


#pragma mark - Method Public

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return _items[(NSUInteger)indexPath.row];
}

- (void)handleTableViewDataSourceAndDelegate:(UITableView *)tableView {
    tableView.delegate = self;
    tableView.dataSource = self;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeightBlock(indexPath, [self itemAtIndexPath:indexPath]);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    _aCellWillDisplayBlock(indexPath, [self itemAtIndexPath:indexPath], cell);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _cellDidSelectBlock(indexPath, [self itemAtIndexPath:indexPath]);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_viewForHeaderBlock) {
        return _viewForHeaderBlock();
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_viewForHeaderBlock && _heightForHeader) {
        return _heightForHeader;
    }
    return 0.0f;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellConfigureBlock(tableView, indexPath);
}


@end