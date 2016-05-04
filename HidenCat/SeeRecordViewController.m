//
//  SeeRecordViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/1.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "SeeRecordViewController.h"
#import "SeeRecordTableViewCell.h"
#import "SeeRecordTopView.h"
#import "OneRecordViewConroller.h"
@interface SeeRecordViewController ()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation SeeRecordViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    self.navigationItem.title=@"记录";
    [self.tableView registerNib:[UINib nibWithNibName:@"SeeRecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    [self getTop];
}
-(void)getTop{
    UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, 65)];
    vv.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"SeeRecordTopView" owner:self options:nil];
    SeeRecordTopView *top=arr[0];
    top.frame=CGRectMake(0, 5, XDSW, 60);
    [vv addSubview:top];
    self.tableView.tableHeaderView=vv;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SeeRecordTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 300;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    OneRecordViewConroller *ovc=[[OneRecordViewConroller alloc]init];
    [self.navigationController pushViewController:ovc animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, 20)];
    vv.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    return vv;
}
@end
