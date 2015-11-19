//
//  MainController.m
//  DYWeibo
//
//  Created by YuLeiming on 19/11/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import "MainController.h"

@interface MainController ()

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationItem setTitle:@"DYWeibo"];
    self.tableView = ({
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        [self.view addSubview:tableView];
        tableView;
    });
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

@end
