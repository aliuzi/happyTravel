//
//  MoreTableViewController.m
//  喜游迹
//
//  Created by 远山 on 15/12/30.
//  Copyright © 2015年 Leo_Lei. All rights reserved.
//

#import "MoreTableViewController.h"

@interface MoreTableViewController ()<UIAlertViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *Cache;

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self countCahce];
    
    self.tableView.dataSource = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self countCahce];
}

//计算缓存大小
- (void)countCahce
{
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
    self.Cache.text = [NSString stringWithFormat:@"%.1fM",size/1024.0/1024.0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //选择到第三行时弹出清除缓存操作
    if (indexPath.row == 3) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"清除缓存" message:@"确定清除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alter.delegate = self;
        [alter show];
    }
    
    //在点击后取消选中单元格效果
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//当弹出提示框后选择“确定”后，清除缓存
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        [[SDImageCache sharedImageCache] clearDisk];
        [self countCahce];
    }
}

@end
