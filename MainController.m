//
//  MainController.m
//  DYWeibo
//
//  Created by YuLeiming on 19/11/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import "MainController.h"
#import "AFHTTPSessionManager.h"
#import "DYWeiboFrame.h"
#import "NSWeibos.h"
#import "NSObject+MJKeyValue.h"
#import "WeiboTableCellView.h"

#define URL_PREFIX  @"https://api.weibo.com/2/statuses/home_timeline.json?access_token=2.00y9lYWByY87OC8562fb01f14fvWTB&count=20"

@interface MainController ()

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic, strong) NSMutableArray * frames;

@property (nonatomic, strong) NSWeibos * weibos;

//页数
@property (nonatomic, assign) int page;

//下拉刷新控件
@property (nonatomic, strong) UIRefreshControl * refreshController;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:@"DYWeibo"];
    self.page = 1;
    self.frames = [[NSMutableArray alloc] init];

    self.tableView = ({
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:tableView];
        tableView;
    });

    self.refreshController = [[UIRefreshControl alloc] init];
    [_tableView addSubview:_refreshController];
    [self.refreshController addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventValueChanged];

    [self refreshWeiboTimeline:YES];
}

/**
 * 覆盖刷新
 */
- (void)refreshData
{
    NSLog(@"下拉刷新");
    self.page = 1;
    [self refreshWeiboTimeline:YES];
}

/**
 * 加载更多
 */
- (void)loadMoreData
{
    NSLog(@"加载更多");
    ++self.page;
    [self refreshWeiboTimeline:NO];
}

- (void)initFrames: (BOOL) overide
{
    if(overide)
    {
        [self.frames removeAllObjects];
    }
    for (NSWeibo *weibo in self.weibos.statuses) {
        DYWeiboFrame * frame = [[DYWeiboFrame alloc] init];
        frame.screenWidth = self.view.frame.size.width;
        frame.weibo = weibo;
        [self.frames addObject:frame];
    }

}

- (void) refreshWeiboTimeline:(BOOL) isOverideRefresh
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString * url = [URL_PREFIX stringByAppendingString:[NSString stringWithFormat:@"&page=%i", self.page]];
    NSLog(@"url is: %@", url);
    [manager GET:url parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.weibos = [NSWeibos mj_objectWithKeyValues:responseObject];
        [self initFrames:isOverideRefresh];
        [self.refreshController endRefreshing];
        [_tableView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self.refreshController endRefreshing];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 数据源
#pragma
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.frames count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboTableCellView * cell = [WeiboTableCellView cellWithTableView:tableView];
    [cell setWeiboFrame:self.frames[indexPath.row]];
    if (indexPath.row == [self.frames count] - 1){
        [self loadMoreData];
    }
    return cell;
}

#pragma mark - 代理
#pragma
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    DYWeiboFrame * frame = self.frames[indexPath.row];
    return frame.cellHeightF;
}


@end
