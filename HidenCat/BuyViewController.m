//
//  BuyViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "BuyViewController.h"
#import "BuyHeadView.h"
#import "BuyTableViewCell.h"
@interface BuyViewController ()<UITableViewDelegate,UITableViewDataSource,BuyHeadViewDelegate>
@property(nonatomic,assign)BOOL SpreadClick;
@property(nonatomic,strong)NSArray *iconImage;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSArray *priceArr;
@property(nonatomic,strong)BuyHeadView *buyView;

@end
@implementation BuyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"确认购买";
    self.iconImage=@[@"miao_money",@"pay_money",@"wechat_money"];
    self.titleArr=@[@"喵币",@"支付宝",@"微信"];
    self.priceArr=@[@"600",@"",@""];

    self.tabeleView.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    self.SpreadClick=NO;
    [self getView];
}
-(void)getView{
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"BuyHeadView" owner:self options:nil];
    self.buyView=arr[0];
    self.buyView.delegate=self;
    UIView *vi=[[UIView alloc]initWithFrame:CGRectMake(0,0, XDSW, 345)];
    self.buyView.frame=CGRectMake(0, 0, XDSW, 345);
    self.buyView.payTitile.text=@"支付宝";
    [vi addSubview:self.buyView];
    self.tabeleView.tableHeaderView=vi;
    self.tabeleView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.tabeleView registerNib:[UINib nibWithNibName:@"BuyTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    
}
-(void)buyClick:(UIButton *)btn{
    self.SpreadClick=!self.SpreadClick;
    [self.tabeleView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.SpreadClick==YES) {
        return 3;
    }
    else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BuyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.iconImage.image=[UIImage imageNamed:self.iconImage[indexPath.row]];
    cell.titileLabel.text=self.titleArr[indexPath.row];
    cell.leftLabel.text=self.priceArr[indexPath.row];
    cell.tureImage.hidden=YES;
    if ([self.buyView.payTitile.text isEqualToString:cell.titileLabel.text]) {
        cell.tureImage.hidden=NO;
    }
    if ([self.buyView.payTitile.text isEqualToString:cell.titileLabel.text]) {
        cell.tureImage.hidden=NO;
    }
    if ([self.buyView.payTitile.text isEqualToString:cell.titileLabel.text]) {                    cell.tureImage.hidden=NO;
    }
       return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tabeleView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *cellArr=[tableView visibleCells];
    for (BuyTableViewCell *cell in cellArr) {
          cell.tureImage.hidden=YES;
           }
    BuyTableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    cell.tureImage.hidden=NO;
    self.buyView.payChangeLabel.text=self.titleArr[indexPath.row];
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
