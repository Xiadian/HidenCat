//
//  MyFoucusViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyFoucusViewController.h"
#import "MyFoucusTableViewCell.h"
#import "DetailFriendViewController.h"
@interface MyFoucusViewController ()

@end

@implementation MyFoucusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"我的关注";
    [self.tableView registerNib:[UINib nibWithNibName:@"MyFoucusTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyFoucusTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailFriendViewController *dv=[[DetailFriendViewController alloc]init];
    [self.navigationController pushViewController:dv animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
