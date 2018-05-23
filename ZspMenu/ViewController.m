//
//  ViewController.m
//  ZspMenu
//
//  Created by 曾绍鹏 on 2017/4/7.
//  Copyright © 2017年 Paul. All rights reserved.
//

#import "ViewController.h"
#import "ZspMenu.h"

@interface ViewController () <ZspMenuDataSource, ZspMenuDelegate>

@property (nonatomic, strong) ZspMenu *menu;

@property (nonatomic, strong) NSArray *location;
@property (nonatomic, strong) NSArray *sort;
@property (nonatomic, strong) NSArray *choose;

@property (nonatomic, strong) NSArray *yuexiu;
@property (nonatomic, strong) NSArray *tianhe;
@property (nonatomic, strong) NSArray *panyu;
@property (nonatomic, strong) NSArray *hanzhu;
@property (nonatomic, strong) NSArray *baiyun;
@property (nonatomic, strong) NSArray *liwan;
@property (nonatomic, strong) NSArray *huangpu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 数据
    self.location = @[@"位置", @"商圈", @"越秀区", @"天河区", @"番禺区", @"海珠区", @"白云区", @"荔湾区", @"黄埔区"];
    self.sort = @[@"智能排序", @"离我最近", @"好评优先", @"人气最高"];
    self.choose = @[@"筛选", @"折扣商品", @"进店领券", @"下单返券"];
    
    self.yuexiu = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.tianhe = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.panyu = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.hanzhu = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.baiyun = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.liwan = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    self.huangpu = @[@"附近", @"1km", @"3km", @"5km",@"10km",@"全城"];
    _menu = [[ZspMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:44];
    _menu.delegate = self;
    _menu.dataSource = self;
    [self.view addSubview:_menu];
    
    [_menu selectDeafultIndexPath];
}

- (NSInteger)numberOfColumnsInMenu:(ZspMenu *)menu {
    return 3;
}

- (NSInteger)menu:(ZspMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (column == 0) {
        return self.location.count;
    }else if(column == 1) {
        return self.sort.count;
    }else {
        return self.choose.count;
    }
}

- (NSString *)menu:(ZspMenu *)menu titleForRowAtIndexPath:(ZspIndexPath *)indexPath {
    if (indexPath.column == 0) {
        return self.location[indexPath.row];
    }else if(indexPath.column == 1) {
        return self.sort[indexPath.row];
    }else {
        return self.choose[indexPath.row];
    }
}

- (NSString *)menu:(ZspMenu *)menu imageNameForRowAtIndexPath:(ZspIndexPath *)indexPath {
    if (indexPath.column == 0 || indexPath.column == 1) {
        return @"baidu";
    }
    return nil;
}

- (NSString *)menu:(ZspMenu *)menu imageForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath {
    if (indexPath.column == 0 && indexPath.item >= 0) {
        return @"baidu";
    }
    return nil;
}

- (NSString *)menu:(ZspMenu *)menu detailTextForRowAtIndexPath:(ZspIndexPath *)indexPath {
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(ZspMenu *)menu detailTextForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath {
    return [@(arc4random()%1000) stringValue];
}

- (NSInteger)menu:(ZspMenu *)menu numberOfItemsInRow:(NSInteger)row inColumn:(NSInteger)column {
    if (column == 0) {
        if (row == 2) {
            return self.yuexiu.count;
        }else if (row == 3) {
            return self.tianhe.count;
        }else if (row == 4) {
            return self.panyu.count;
        }else if (row == 5) {
            return self.hanzhu.count;
        }else if (row == 6) {
            return self.baiyun.count;
        }else if (row == 7) {
            return self.liwan.count;
        }else if (row == 8) {
            return self.huangpu.count;
        }
    }
    return 0;
}

- (NSString *)menu:(ZspMenu *)menu titleForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (indexPath.column == 0) {
        if (row == 2) {
            return self.yuexiu[indexPath.item];
        }else if (row == 3) {
            return self.tianhe[indexPath.item];
        }else if (row == 4) {
            return self.panyu[indexPath.item];
        }else if (row == 5) {
            return self.hanzhu[indexPath.item];
        }else if (row == 6) {
            return self.baiyun[indexPath.item];
        }else if (row == 7) {
            return self.liwan[indexPath.item];
        }else if (row == 8) {
            return self.huangpu[indexPath.item];
        }
    }
    return nil;
}

- (void)menu:(ZspMenu *)menu didSelectRowAtIndexPath:(ZspIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld",indexPath.column,indexPath.row);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
