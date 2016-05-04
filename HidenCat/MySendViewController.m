//
//  MySendViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MySendViewController.h"
#import "MySendTableViewCell.h"
#import "ViewPlayViewController.h"
@interface MySendViewController ()<UITableViewDelegate,UITableViewDataSource,MySendDelegate>

@end

@implementation MySendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的发布";
    // Do any additional setup after loading the view from its nib
    [self.tableView registerNib:[UINib nibWithNibName:@"MySendTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MySendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.delegate=self;
        // cell.imgView.image=[UIImage imageNamed:@"cang_title"];
        return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vv=[[UIView alloc]init];
    vv.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    return vv;
}
#pragma mark cell代理方法
-(void)edite:(UIButton *)sender{
    ViewPlayViewController *np=[[ViewPlayViewController alloc]init];
    [self.navigationController pushViewController:np animated:YES];
}
-(void)resend:(UIButton *)sender{
   

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
