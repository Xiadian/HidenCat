//
//  CommentViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/29.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface CommentViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *commetTextField;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *buttomConstraint;
@end
