//
//  FriendViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendTableViewCell.h"
#import "FriendTopView.h"
#import "DetailFriendViewController.h"
@interface FriendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *timeArr;
@property(nonatomic,strong)NSArray *nameArr;
@property(nonatomic,strong)NSArray *picArr;
@property(nonatomic,strong)NSArray *countArr;



@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self refresh];
    [self getForModel];
    // Do any additional setup after loading the view.
}
-(void)getForModel{
    self.timeArr=@[@"3秒钟前更新",@"6秒钟前更新",@"10秒钟前更新",@"16秒钟前更新",@"18秒钟前更新",@"20秒钟前更新",@"27秒钟前更新",@"34秒钟前更新",@"37秒钟前更新",@"40秒钟前更新"];
    self.nameArr=@[@"憨憨",@"猫猫",@"夏雨荷",@"舒克",@"贝塔",@"爱丽丝",@"点点",@"小时候",@"那些年",@"匆匆"];
    self.picArr=@[@"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg",
                  @"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg"];
    self.countArr=@[@"1423",@"2423",@"4323",@"1343",@"8142",@"2423",@"2223",@"3323",@"4343",@"2044"];
}
-(void)refresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer.automaticallyChangeAlpha = YES;
}
-(void)loadData{
    NSLog(@"开始刷新");
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
    //gcd模拟俩延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self getForModel];
        [self.tableView reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
    });
}
-(void)changeModel{
    NSLog(@"换数组");
    self.timeArr=@[@"3秒钟前更新",@"6秒钟前更新",@"10秒钟前更新",@"16秒钟前更新",@"18秒钟前更新",@"20秒钟前更新",@"27秒钟前更新",@"34秒钟前更新",@"37秒钟前更新",@"40秒钟前更新",@"3秒钟前更新",@"6秒钟前更新",@"10秒钟前更新",@"16秒钟前更新",@"18秒钟前更新",@"20秒钟前更新",@"27秒钟前更新",@"34秒钟前更新",@"37秒钟前更新",@"40秒钟前更新"];
    self.nameArr=@[@"憨憨",@"猫猫",@"夏雨荷",@"舒克",@"贝塔",@"爱丽丝",@"点点",@"小时候",@"那些年",@"匆匆",@"憨憨",@"猫猫",@"夏雨荷",@"舒克",@"贝塔",@"爱丽丝",@"点点",@"小时候",@"那些年",@"匆匆"];
    self.picArr=@[@"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg",
                  @"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg",@"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg",
                  @"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg"];
    self.countArr=@[@"1423",@"2423",@"4323",@"1343",@"8142",@"2423",@"2223",@"3323",@"4343",@"2044",@"1423",@"2423",@"4323",@"1343",@"8142",@"2423",@"2223",@"3323",@"4343",@"2044"];
}
-(void)loadMoreData{
    [self.tableView.mj_footer beginRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self changeModel];
        [self.tableView reloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
    });
}
-(void)config{
    self.navigationItem.title=@"藏友";
    [self.tableView registerNib:[UINib nibWithNibName:@"FriendTableViewCell" bundle:nil] forCellReuseIdentifier:@"fc"];
    //添加头视图;
    self.tableView.tableHeaderView=[[FriendTopView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
}
#pragma mark -tableview代理
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"fc" forIndexPath:indexPath];
    cell.title.text=self.nameArr[indexPath.row];
    cell.timeLabel.text=self.timeArr[indexPath.row];
    [cell.imageIcon sd_setBackgroundImageWithURL:[NSURL URLWithString:self.picArr[indexPath.row]] forState:UIControlStateNormal];
    cell.countLabel.text=self.countArr[indexPath.row];
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.countArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailFriendViewController *df=[[DetailFriendViewController alloc]init];
    df.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:df animated:YES];
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
