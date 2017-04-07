//
//  ZspMenu.h
//  ZspMenu
//
//  Created by 曾绍鹏 on 4/18/16.
//  Copyright © 2016 Paul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZspIndexPath : NSObject

@property (nonatomic, assign) NSInteger row; //行
@property (nonatomic, assign) NSInteger column; //列
@property (nonatomic, assign) NSInteger item; //item

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row;

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row;
+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item;

@end

#pragma  mark - datasource
@class ZspMenu;
@protocol ZspMenuDataSource <NSObject>

@required
//每个column有多少行
- (NSInteger)menu:(ZspMenu *)menu numberOfRowsInColumn:(NSInteger)column;
//每个column中每行的title
- (NSString *)menu:(ZspMenu *)menu titleForRowAtIndexPath:(ZspIndexPath *)indexPath;

@optional
//有多少个column，默认为1列
- (NSInteger)numberOfColumnsInMenu:(ZspMenu *)menu;
//第column列，没行的image
- (NSString *)menu:(ZspMenu *)menu imageNameForRowAtIndexPath:(ZspIndexPath *)indexPath;
//detail text
- (NSString *)menu:(ZspMenu *)menu detailTextForRowAtIndexPath:(ZspIndexPath *)indexPath;
//某列的某行item的数量，如果有，则说明有二级菜单，反之亦然
- (NSInteger)menu:(ZspMenu *)menu numberOfItemsInRow:(NSInteger)row inColumn:(NSInteger)column;
//如果有二级菜单，则实现下列协议
//二级菜单的标题
- (NSString *)menu:(ZspMenu *)menu titleForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath;
//二级菜单的image
- (NSString *)menu:(ZspMenu *)menu imageForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath;
//二级菜单的detail text
- (NSString *)menu:(ZspMenu *)menu detailTextForItemsInRowAtIndexPath:(ZspIndexPath *)indexPath;
@end

#pragma mark - delegate
@protocol ZspMenuDelegate <NSObject>

@optional
//点击
- (void)menu:(ZspMenu *)menu didSelectRowAtIndexPath:(ZspIndexPath *)indexPath;

@end

@interface ZspMenu : UIView

@property (nonatomic, weak) id<ZspMenuDelegate> delegate;
@property (nonatomic, weak) id<ZspMenuDataSource> dataSource;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIFont *detailTextFont;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) NSInteger fontSize;
//当前选中的列
@property (nonatomic, strong) NSMutableArray *currentSelectedRows;
//当有二级列表的时候，是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveItemValid;
//获取title
- (NSString *)titleForRowAtIndexPath:(ZspIndexPath *)indexPath;
//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
//菜单切换，选中的indexPath
- (void)selectIndexPath:(ZspIndexPath *)indexPath;
//默认选中
- (void)selectDeafultIndexPath;
//数据重载
- (void)reloadData;

@end
