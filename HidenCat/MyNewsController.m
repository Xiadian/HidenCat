


//
//  MyNewsController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//
#import "MyNewsController.h"
#import "MyOrderTableViewCell.h"
#import "MyNewsTableViewCell.h"
#import "MyNewsChangePriceTableViewCell.h"
#import "TalkPriceView.h"
@interface MyNewsController ()<UITableViewDataSource,UITableViewDelegate,TalkPriceDelegate>
@property(nonatomic,strong)UIView *backView;
@property(nonatomic,strong)TalkPriceView *talkPriceView;
@property(nonatomic,strong)UITableView *leftTable;
@property(nonatomic,strong)UITableView *rightTable;
@end
@implementation MyNewsController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我的消息";
    self.systemNew.textColor=[UIColor redColor];
    [self getTableView];
    [self getFresh];
    UITapGestureRecognizer *tgg=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(saleClick:)];
    [self.systemNew addGestureRecognizer:tgg];
    self.systemNew.userInteractionEnabled=YES;
    UITapGestureRecognizer *tgb=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(buyClick:)];
    [self.notification addGestureRecognizer:tgb];
    self.notification.userInteractionEnabled=YES;
}
-(void)getFresh{
    [self getLeftFresh];
    [self getRightFresh];
}
-(void)getLeftFresh{
    // 马上进入刷新状态
    [self.leftTable.mj_header beginRefreshing];
    //gcd模拟俩延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.leftTable reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.leftTable.mj_header endRefreshing];
    });
}
-(void)getRightFresh{
    // 马上进入刷新状态
    [self.rightTable.mj_header beginRefreshing];
    //gcd模拟俩延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.rightTable reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.rightTable.mj_header endRefreshing];
    });
    
    
}
-(void)saleClick:(UITapGestureRecognizer *)label{
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset=CGPointMake(0, 0);
        
    }];
}
-(void)buyClick:(UITapGestureRecognizer *)label{
    [UIView animateWithDuration:0.5 animations:^{
        self.scrollView.contentOffset=CGPointMake(XDSW, 0);
        
    }];
}
-(void)getTableView{
    self.scrollView.frame=CGRectMake(0,114, [UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height-163);
    self.scrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*2,self.scrollView.bounds.size.height);
    self.scrollView.delegate=self;
    self.scrollView.showsVerticalScrollIndicator=NO;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.bounces=NO;
    self.leftTable=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height)];
    [_leftTable registerNib:[UINib nibWithNibName:@"MyNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"xl"];
    [_leftTable registerNib:[UINib nibWithNibName:@"MyNewsChangePriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"xlc"];
    _leftTable.tag=1;
    _leftTable.delegate=self;
    _leftTable.dataSource=self;
    self.leftTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getFresh];
    }];
    self.leftTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(leftLoadMoreData)];
    self.leftTable.mj_footer.automaticallyChangeAlpha = YES;
    self.scrollView.pagingEnabled=YES;
    //右tableView
    _rightTable=[[UITableView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width,0, [UIScreen mainScreen].bounds.size.width, self.scrollView.frame.size.height)];
    _rightTable.tag=2;
    _rightTable.delegate=self;
    _rightTable.dataSource=self;
    [_rightTable registerNib:[UINib nibWithNibName:@"MyNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"xr"];
    [_rightTable registerNib:[UINib nibWithNibName:@"MyNewsChangePriceTableViewCell" bundle:nil] forCellReuseIdentifier:@"xrc"];
    self.rightTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getFresh];
    }];
    self.rightTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(rightLoadMoreData)];
    self.rightTable.mj_footer.automaticallyChangeAlpha = YES;
    [self.scrollView addSubview:_leftTable];
    [self.scrollView addSubview:_rightTable];

}
-(void)leftLoadMoreData{



}
-(void)rightLoadMoreData{
    
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[MyNewsChangePriceTableViewCell class]]) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, XDSH)];
        self.backView=view;
        view.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
        [self.view addSubview:view];
        // view.userInteractionEnabled=YES;
        NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"TalkPriceView" owner:self options:nil];
        TalkPriceView *cp=arr[0];
        self.talkPriceView=cp;
        cp.delegate=self;
        cp.layer.cornerRadius=10;
        cp.clipsToBounds=YES;
        cp.bounds=CGRectMake(0,0,310,170);
        cp.center=CGPointMake(XDSW/2.0, XDSH/2.0);
        [view addSubview:cp];
    }
}
//议价消息的确定按钮
-(void)srue:(UIButton *)sender{
    [self.backView removeFromSuperview];
}
//议价消息的取消按钮
-(void)chanel:(UIButton *)sender{
    [self.backView removeFromSuperview];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==1) {
        if (indexPath.row%2==0) {
            MyNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xl" forIndexPath:indexPath];
            // cell.imgView.image=[UIImage imageNamed:@"cang_title"];
            return cell;

        }
        else{
         MyNewsChangePriceTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xlc" forIndexPath:indexPath];
            return cell;
        }
          }
    else if(tableView.tag==2){
        if (indexPath.row%2==0) {
            MyNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xr" forIndexPath:indexPath];
            // cell.imgView.image=[UIImage imageNamed:@"cang_title"];
            return cell;
            
        }
        else{
            MyNewsChangePriceTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xrc" forIndexPath:indexPath];
            return cell;
        }
    }
    return nil;
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x>=[UIScreen mainScreen].bounds.size.width) {
        self.notification.textColor=[UIColor redColor];
        self.systemNew.textColor=[UIColor blackColor];
        
    }
    else if(scrollView.contentOffset.x==0){
        self.notification.textColor=[UIColor blackColor];
        self.systemNew.textColor=[UIColor redColor];
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
