//
//  DetailViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/3/30.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface DetailViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,assign)BOOL favoriteClickState;
@property(nonatomic,assign)BOOL zanClickState;
@end
