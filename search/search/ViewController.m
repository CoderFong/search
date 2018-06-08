//
//  ViewController.m
//  search
//
//  Created by Playboy on 2018/6/7.
//  Copyright © 2018年 Playboy. All rights reserved.
//

#import "ViewController.h"
#import "PBSearchTopView.h"
#import "PBSearchCell.h"

#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define IS_IPHONE_X  (kScreenHeight == 812.0f) ? YES : NO
#define Height_NavContentBar 44.0f
#define Height_StatusBar (IS_IPHONE_X==YES)?44.0f: 20.0f
#define Height_NavBar (IS_IPHONE_X==YES)?88.0f: 64.0f
#define Height_TabBar (IS_IPHONE_X==YES)?83.0f: 49.0f

static NSString * const kPBSearchCell = @"PBSearchCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PBSearchTopView *topView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController setNavigationBarHidden:YES];
    [self setupSearchNavgition];
    [self setupContentView];
}

// 初始化导航栏
- (void)setupSearchNavgition {
    self.topView = [[PBSearchTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, Height_NavBar)];
    [self.view addSubview:self.topView];
}

- (void)setupContentView {
    // 为什么tableView的height设置为kScreenHeight-Height_NavBar有问题？？
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height_NavBar, kScreenWidth, kScreenHeight-CGRectGetMaxY(self.topView.frame)) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[PBSearchCell class] forCellReuseIdentifier:kPBSearchCell];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PBSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:kPBSearchCell forIndexPath:indexPath];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 340;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
