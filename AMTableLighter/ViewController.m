//
//  ViewController.m
//  AMTableLighter
//
//  Created by Mi Zhengdi on 27/1/2016.
//  Copyright © 2016 AM. All rights reserved.
//

#import "ViewController.h"
#import "AMTableDataDelegate.h"
#import "AMTestVO.h"
#import "AMCustomCell.h"
#import "AMXibCell.h"

static NSString *const customCellIdentifier = @"customCell";
static NSString *const xibCellIdentifier = @"AMXibCell";

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) AMTableDataDelegate *tableHander;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupData];
    [self setupTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupData {
    _dataArray = [NSMutableArray array];
    
    for (int i = 0; i < 20; i++) {
        AMTestVO *vo = [[AMTestVO alloc] initWithTitle:[NSString stringWithFormat:@"第%d行", i] height:44 + i * 5 ];
        [_dataArray addObject:vo];
    }
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:xibCellIdentifier bundle:nil] forCellReuseIdentifier:xibCellIdentifier];
    [self.tableView registerClass:[AMCustomCell class] forCellReuseIdentifier:customCellIdentifier];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    _tableHander = [[AMTableDataDelegate alloc] initWithItems:_dataArray configureCellBlock:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
        
        return (indexPath.row % 2 == 0 ? [tableView dequeueReusableCellWithIdentifier:customCellIdentifier forIndexPath:indexPath] : [tableView dequeueReusableCellWithIdentifier:xibCellIdentifier forIndexPath:indexPath]);
        
    } cellHeightBlock:^CGFloat(NSIndexPath *indexPath, id item) {
        if (item) {
            return ((AMTestVO *)item).height;
        }
        return 44.0f;
    } cellWillDisplay:^(NSIndexPath *indexPath, id item, UITableViewCell *cell) {
        if (indexPath.row % 2 == 0) {
            [(AMCustomCell *)cell fillValues:item];
        } else {
            [(AMXibCell *)cell fillValues:item];
        }
    } didSelectBlock:^(NSIndexPath *indexPath, id item) {
        NSLog(@"++++");
    } viewForHeaderBlock:^UIView *{
        UILabel *label = [[UILabel alloc] init];
        label.text = @"测试";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor blueColor];
        label.textColor = [UIColor whiteColor];
        return label;
    } heightForHeader:44.0f];
    [_tableHander handleTableViewDataSourceAndDelegate:self.tableView];
}

//#pragma mark - UITableViewDelegate
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44.0f;
//}
//
//
//#pragma mark - UITableViewDataSource
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _dataArray.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static  NSString *identifier = @"ceshi";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    return cell;
//}

@end
