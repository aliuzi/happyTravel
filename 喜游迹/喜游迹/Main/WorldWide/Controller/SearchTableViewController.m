//
//  SearchTableViewController.m
//  喜游迹
//
//  Created by LEO on 1/10/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()<UITableViewDelegate, UITableViewDataSource> {
    __weak IBOutlet UIButton *Australia;
    __weak IBOutlet UIButton *Ireland;
    __weak IBOutlet UIButton *Norway;
    __weak IBOutlet UIButton *Iceland;
    __weak IBOutlet UIButton *France;
    __weak IBOutlet UIButton *NewZealand;
    

    __weak IBOutlet UILabel *SwedenLabel;
    __weak IBOutlet UILabel *IrelandLabel;
    __weak IBOutlet UILabel *YunNanLabel;
    __weak IBOutlet UILabel *WestLakeLabel;
    
    __weak IBOutlet UISearchBar *searchBar;
}

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  给按钮设置边框
    NSArray *buttonArray = @[Australia, Ireland, Norway, Iceland,France, NewZealand];
    for (UIButton *button in buttonArray) {
        button.layer.borderColor = kNavBGColor.CGColor;
        button.layer.borderWidth = 2.0f;
        button.layer.cornerRadius = 5.0f;
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)clearAction:(UIButton *)sender {
    SwedenLabel.text = nil;
    IrelandLabel.text = nil;
    YunNanLabel.text = nil;
    WestLakeLabel.text = nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
