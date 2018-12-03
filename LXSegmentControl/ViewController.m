//
//  ViewController.m
//  LXSegmentControl
//
//  Created by LX Zeng on 2018/12/3.
//  Copyright © 2018   https://github.com/nick8brown   All rights reserved.
//

#import "ViewController.h"

#import "LXSegmentType_0ViewController.h"
#import "LXSegmentType_1ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义SegmentControl";
    
    // 初始化导航栏
    [self setupNavBar];
}

#pragma mark - 初始化导航栏
- (void)setupNavBar {
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:AppFont(18), NSForegroundColorAttributeName:SYS_White_Color}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage getImageWithColor:AppHTMLColor(@"4bccbc")] forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - 样式一
- (IBAction)type_0BtnClick:(UIButton *)sender {
    LXSegmentType_0ViewController *segmentType_0VC = [[LXSegmentType_0ViewController alloc] init];
    segmentType_0VC.title = @"样式一";
    [self.navigationController pushViewController:segmentType_0VC animated:YES];
}

#pragma mark - 样式二
- (IBAction)type_1BtnClick:(UIButton *)sender {
    LXSegmentType_1ViewController *segmentType_1VC = [[LXSegmentType_1ViewController alloc] init];
    segmentType_1VC.title = @"样式二";
    [self.navigationController pushViewController:segmentType_1VC animated:YES];
}

@end
