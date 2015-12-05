//
//  ComposeViewController.m
//  DYWeibo
//
//  Created by YuLeiming on 5/12/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//  发布微博
//

#import "ComposeViewController.h"

@interface ComposeViewController ()

@property (nonatomic, strong) UILabel * label;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label = ({
        UILabel * uiLabel = [[UILabel alloc] initWithFrame:self.view.frame];
        uiLabel.font = [UIFont systemFontOfSize:30];
        uiLabel.text = @"compose weibo";
        [self.view addSubview:uiLabel];
        uiLabel;
    });
    [self initNavigationBar];
}

- (void)initNavigationBar {
    self.navigationItem.title = @"Compose";
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(finish)];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)finish {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
