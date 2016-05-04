//
//  DetailFriendViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/29.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailFriendViewController.h"
#import "DetailFriendHeadView.h"
#import "DetailFriendTableViewCell.h"
#import "DetailViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface DetailFriendViewController ()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation DetailFriendViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self config];
}
-(void)config{
  self.navigationItem.title=@"小猫咪";
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailFriendTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator=NO;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.backgroundColor=XDREDColor;
    self.tableView.bounces=NO;
    self.tableView.tableHeaderView=[self getTopView];
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"0324c_11"] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, 8, 8, 8);
    self.navigationItem.rightBarButtonItem=btnBack;
}
#pragma mark 分享按钮
-(void)share{
    //1、创建分享参数
  //  NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
   // （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    //if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                         images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]
                                            url:[NSURL URLWithString:@"http://mob.com"]
                                          title:@"分享标题"
                                           type:SSDKContentTypeAuto];
        //2、分享（可以弹出我们的分享菜单和编辑界面）
        [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                                 items:nil
                           shareParams:shareParams
                   onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                       
                       switch (state) {
                           case SSDKResponseStateSuccess:
                           {
                               UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                                   message:nil
                                                                                  delegate:nil
                                                                         cancelButtonTitle:@"确定"
                                                                         otherButtonTitles:nil];
                               [alertView show];
                               break;
                           }
                           case SSDKResponseStateFail:
                           {
                               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                               message:[NSString stringWithFormat:@"%@",error]
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"OK"
                                                                     otherButtonTitles:nil, nil];
                               [alert show];
                               break;
                           }
                           default:
                               break;
                       }
                   }
         ];//}

}
-(UIView *)getTopView{
    UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,150)];
    vv.backgroundColor=XDREDColor;
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"DetailFriendHeadView" owner:self options:nil];
    DetailFriendHeadView *cc=arr[0];    
    cc.iconBtn.layer.cornerRadius=50;
    cc.iconBtn.clipsToBounds=YES;
    cc.starBtn.layer.cornerRadius=8;
    cc.starBtn.clipsToBounds=YES;
    cc.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,150);
    [vv addSubview:cc];
    return vv;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailFriendTableViewCell *db=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    [db.image sd_setImageWithURL:[NSURL URLWithString:@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan4.jpg"]];
    return db;
};
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 414;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *dv=[[DetailViewController alloc]init];
    dv.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:dv animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIImage *image = [UIImage imageNamed:@"square_girl2"];
    [self.navigationController.navigationBar setBackgroundImage:image                                                  forBarMetrics:UIBarMetricsCompact];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:1];
    self.navigationController.navigationBar.barTintColor=XDREDColor;
}
@end
