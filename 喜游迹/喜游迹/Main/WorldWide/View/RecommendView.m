//
//  RecommendView.m
//  喜游迹
//
//  Created by LEO on 1/4/16.
//  Copyright © 2016 Leo_Lei. All rights reserved.
//

#import "RecommendView.h"
#import "SearchTableViewController.h"
@interface RecommendView()<UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation RecommendView

- (void)awakeFromNib {
    _bgImageView.clipsToBounds = YES;
    _searchBar.delegate = self;
}

- (void)setRecommendModel:(RecommendModel *)recommendModel {
    if (_recommendModel != recommendModel) {
        _recommendModel = recommendModel;
        [self setNeedsLayout];
    }
}

#pragma mark - 导入数据
- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSURL *imageUrl = [NSURL URLWithString:_recommendModel.faceImage];
    [_bgImageView sd_setImageWithURL:imageUrl];
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    //  从故事板中加载搜索页
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"WorldWide"
                                                         bundle:nil];
    SearchTableViewController *searchVC = [storyBoard instantiateViewControllerWithIdentifier:@"searchTableView"];
    [self.belongController presentViewController:searchVC
                                        animated:YES
                                      completion:nil];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.belongController popoverPresentationController];
}

@end
