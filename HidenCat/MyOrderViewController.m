


//
//  MyOrderViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyOrderViewController.h"
#import "MyOrderTableViewCell.h"
@interface MyOrderViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mySaleLB.textColor=[UIColor redColor];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"我的订单";
    UITapGestureRecognizer *tgg=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(saleClick:)];
    [self.mySaleLB addGestureRecognizer:tgg];
    self.mySaleLB.userInteractionEnabled=YES;
    UITapGestureRecognizer *tgb=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buyClick:)];
    [self.myBuyLB addGestureRecognizer:tgb];
    self.myBuyLB.userInteractionEnabled=YES;
    [self configScrollView];
}
-(void)saleClick:(UITapGestureRecognizer *)label{
    [UIView animateWithDuration:0.5 animations:^{
        self.myScrollView.contentOffset=CGPointMake(0, 0);

    }];
}
-(void)buyClick:(UITapGestureRecognizer *)label{
    [UIView animateWithDuration:0.5 animations:^{
        self.myScrollView.contentOffset=CGPointMake(XDSW, 0);
        
    }];
}
-(void)configScrollView{
    self.myScrollView.frame=CGRectMake(0,114, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-163);
    self.myScrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2,self.myScrollView.bounds.size.height);
    self.myScrollView.delegate=self;
    self.myScrollView.showsVerticalScrollIndicator=NO;
    self.myScrollView.showsHorizontalScrollIndicator=NO;
    self.myScrollView.bounces=NO;
    UITableView *leftTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.myScrollView.frame.size.height)];
    [leftTable registerNib:[UINib nibWithNibName:@"MyOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"xl"];
    leftTable.tag=1;
    leftTable.delegate=self;
    leftTable.dataSource=self;
    self.myScrollView.pagingEnabled=YES;
    //右tableView
    UITableView *rightTable=[[UITableView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width,0, [UIScreen mainScreen].bounds.size.width, self.myScrollView.frame.size.height)];
    rightTable.tag=2;
    rightTable.delegate=self;
    rightTable.dataSource=self;
     [rightTable registerNib:[UINib nibWithNibName:@"MyOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"xr"];
    [self.myScrollView addSubview:leftTable];
    [self.myScrollView addSubview:rightTable];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==1) {
        MyOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xl" forIndexPath:indexPath];
        cell.imgView.image=[UIImage imageNamed:@"cang_title"];
        return cell;
    }
    else if(tableView.tag==2){
         MyOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xr" forIndexPath:indexPath];
        cell.imgView.image=[UIImage imageNamed:@"cang_title"];
        return cell;
    }
    return nil;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    UIView *vv=[[UIView alloc]init];
    vv.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    return vv;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>=[UIScreen mainScreen].bounds.size.width) {
        self.myBuyLB.textColor=[UIColor redColor];
        self.mySaleLB.textColor=[UIColor blackColor];

    }
    else if(scrollView.contentOffset.x==0){
        self.myBuyLB.textColor=[UIColor blackColor];
        self.mySaleLB.textColor=[UIColor redColor];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
