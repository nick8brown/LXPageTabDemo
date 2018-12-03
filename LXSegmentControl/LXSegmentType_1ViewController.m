//
//  LXSegmentType_1ViewController.m
//  LXSegmentControl
//
//  Created by LX Zeng on 2018/12/3.
//  Copyright © 2018   https://github.com/nick8brown   All rights reserved.
//

#import "LXSegmentType_1ViewController.h"

#import "LXSegmentTitleViewController.h"

#import "LXPageTabView.h"

#define CellIdentifier @"Cell"

@interface LXSegmentType_1ViewController () <UITableViewDataSource, UITableViewDelegate, LXPageTabViewDelegate>

{
    LXPageTabView *_pageTabView;
}
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSMutableArray *tableViewArray;

@end

@implementation LXSegmentType_1ViewController

#pragma mark - lazy load
- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"礼物TOP100", @"每日推荐", @"新星榜", @"送女友", @"送基友", @"送同事", @"送长辈"];
    }
    return _titleArray;
}

- (NSMutableArray *)tableViewArray {
    if (!_tableViewArray) {
        _tableViewArray = [NSMutableArray array];
    }
    return _tableViewArray;
}

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化导航栏
    [self setupNavBar];
    
    // 初始化segmentType_1View
    [self setupSegmentType_1View];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    // leftBarButtonItem（返回）
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [btn setImage:ImageNamed(@"back") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *returnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.navigationItem.leftBarButtonItems = @[returnItem];
}

// 返回
- (void)returnBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 初始化segmentType_1View
- (void)setupSegmentType_1View {
    for (int i = 0; i < self.titleArray.count; i++) {
        LXSegmentTitleViewController *vc = [[LXSegmentTitleViewController alloc] init];
        
        // 初始化tableView
        [vc.view addSubview:[self setupTableView:i]];

        [self addChildViewController:vc];
    }
    
    _pageTabView = [[LXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:self.titleArray];
    _pageTabView.frame = CGRectMake(0, SYS_NavigationBar_HEIGHT, kScreen_WIDTH, kScreen_HEIGHT-SYS_NavigationBar_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 40);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = AppHTMLColor(@"c8c8c8");
    _pageTabView.selectedColor = AppHTMLColor(@"ffffff");
    _pageTabView.tabBackgroundColor = AppHTMLColor(@"ee8c8e");
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = LXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = LXPageTabIndicatorStyleDefault;
    _pageTabView.indicatorWidth = 20;
    _pageTabView.indicatorHeight = 10;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
}

// 初始化tableView
- (UITableView *)setupTableView:(NSInteger)index {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_WIDTH, kScreen_HEIGHT-SYS_NavigationBar_HEIGHT-40) style:UITableViewStyleGrouped];
    tableView.backgroundColor = SYS_White_Color;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableViewArray addObject:tableView];
    
    return tableView;
}

#pragma mark - UITableViewDataSource
// 段数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

// cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.titleArray[_pageTabView.selectedTabIndex];
    return cell;
}

#pragma mark - UITableViewDelegate
// 行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

// 段头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

// 段尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

// 段头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

// 段尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}

// 选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

#pragma mark - LXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);

    //
    [self.tableViewArray[selectedTabIndex] reloadData];
}

@end
