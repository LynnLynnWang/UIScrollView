//
//  ViewController.m
//  UINavigationController
//
//  Created by lynn on 16/8/11.
//  Copyright © 2016年 smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int i;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    
    i = 0;
}

- (void)configUI
{

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //设置导航栏的颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    
    //取出来导航栏的View
    UIView * view = self.navigationController.navigationBar.subviews.firstObject;
    view.alpha = 0;
    

    
    UITableView * table = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    
    [self.view addSubview:table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行", i++];
    
    return cell;
}



//监听UItableView的滑动 这个用UItableView的代理即可
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        UIView * view = self.navigationController.navigationBar.subviews.firstObject;
        view.alpha = scrollView.contentOffset.y/200;
    }
}



@end










