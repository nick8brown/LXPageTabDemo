//
//  LXSegmentType_0ViewController.m
//  LXSegmentControl
//
//  Created by LX Zeng on 2018/12/3.
//  Copyright © 2018   https://github.com/nick8brown   All rights reserved.
//

#import "LXSegmentType_0ViewController.h"

#import "LXSegmentTitleViewController.h"

#import "XXPageTabView.h"

@interface LXSegmentType_0ViewController () <XXPageTabViewDelegate>

{
    XXPageTabView *_pageTabView;
}

@end

@implementation LXSegmentType_0ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化导航栏
    [self setupNavBar];

    // 初始化segmentType_0View
    [self setupSegmentType_0View];
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

#pragma mark - 初始化segmentType_0View
- (void)setupSegmentType_0View {
    // 1.我的项目组
    LXSegmentTitleViewController *title_0VC = [[LXSegmentTitleViewController alloc] init];
    title_0VC.view.backgroundColor = SYS_Cyan_Color;
    
    // 2.通讯录
    LXSegmentTitleViewController *title_1VC = [[LXSegmentTitleViewController alloc] init];
    title_1VC.view.backgroundColor = SYS_Yellow_Color;

    [self addChildViewController:title_0VC];
    [self addChildViewController:title_1VC];

    _pageTabView = [[XXPageTabView alloc] initWithChildControllers:self.childViewControllers childTitles:@[@"我的好友", @"通讯录"]];
    _pageTabView.frame = CGRectMake(0, SYS_NavigationBar_HEIGHT, kScreen_WIDTH, kScreen_HEIGHT-SYS_NavigationBar_HEIGHT);
    _pageTabView.tabSize = CGSizeMake(kScreen_WIDTH, 44);
    _pageTabView.tabItemFont = AppFont(15);
    _pageTabView.unSelectedColor = AppHTMLColor(@"999999");
    _pageTabView.selectedColor = AppHTMLColor(@"4bccbc");
    _pageTabView.bodyBounces = NO;
    _pageTabView.titleStyle = XXPageTabTitleStyleDefault;
    _pageTabView.indicatorStyle = XXPageTabIndicatorStyleFollowText;
    _pageTabView.delegate = self;
    [self.view addSubview:_pageTabView];
}

#pragma mark - XXPageTabViewDelegate
- (void)pageTabViewDidEndChange {
    NSInteger selectedTabIndex = _pageTabView.selectedTabIndex;
    NSLog(@"点击了index：%zd", selectedTabIndex);

    switch (selectedTabIndex) {
        case 0:
        {
            // 我的好友
        }
            break;
        case 1:
        {
            // 通讯录
        }
            break;
    }
}

@end
