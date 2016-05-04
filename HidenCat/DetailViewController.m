



//
//  DetailViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/30.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailHeadView.h"
#import "DetailTableViewCell.h"
#import "ButtomBar.h"
#import "DetailFriendViewController.h"
#import "SeeRecordViewController.h"
#import "BuyViewController.h"
#import "ChangePriceView.h"
#import "PhotoBrowserView.h"
#import "PlayPicViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "CommentViewController.h"
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate,DetailHeadViewDelegate,ButtomBarDelegate,ChangePriceDelegate>
@property(nonatomic,strong)ChangePriceView *changePriceView;
@property(nonatomic,strong)UIView *backView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"详情";
    [self loadButtomBar];
    // Do any additional setup after loading the view from its nib.
    self.tableView.showsHorizontalScrollIndicator=NO;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.bounces=YES;
    self.tableView.tableHeaderView=[self getHeadView];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    self.favoriteClickState=NO;
    self.zanClickState=NO;
}
-(void)loadButtomBar{
    UIView *buttomBar=[[UIView alloc]initWithFrame:CGRectMake(0, XDSH-60, XDSW, 60)];
    buttomBar.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"ButtomBar" owner:self  options:nil];
    ButtomBar *bar=arr[0];
    bar.delegate=self;
    bar.frame=CGRectMake(0, 10, XDSW, 50);
    [buttomBar addSubview:bar];
    [self.view addSubview:buttomBar];
}
-(UIView *)getHeadView{
    UIView *vv=[[UIView alloc]init];
    vv.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 576);
    vv.backgroundColor=[UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"DetailHeadView" owner:self options:nil];
    DetailHeadView *dh=arr[0];
    dh.delegate=self;
    dh.iconBtn.layer.cornerRadius=25;
    dh.iconBtn.clipsToBounds=YES;
    [dh.iconBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:@"http://image.dreamshuo.com/images/t0174fe402905794b59.png"] forState:UIControlStateNormal];
    dh.frame=CGRectMake(0, 0, [UIScreen  mainScreen].bounds.size.width, 466);
    [vv addSubview:dh];
    UIView *btnView=[[UIView alloc]init];
    btnView.frame=CGRectMake(0, 476, XDSW, (XDSW/8.0-9)*2+6);
    btnView.backgroundColor=[UIColor whiteColor];
    for (UIView *view in dh.subviews[1].subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.userInteractionEnabled=YES;
            UITapGestureRecognizer *tg=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
            [view addGestureRecognizer:tg];
        }
    }
    for (int i=0; i<15; i++) {
        UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(1+i%8*(XDSW/8.0+1),2+i/8*((XDSW/8.0-9)+2), XDSW/8.0-9,  XDSW/8.0-9)];
        btn.backgroundColor=[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        [btn setBackgroundImage:[UIImage imageNamed:@"square_girl10"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnDetail:) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.cornerRadius=(XDSW/8.0-9)/2.0;
        btn.clipsToBounds=YES;
        [btnView addSubview:btn];
    }
    [vv addSubview:btnView];
    return vv;
}
-(void)tap:(UITapGestureRecognizer *)tap{
    PlayPicViewController *pcv=[[PlayPicViewController alloc]init];
    pcv.picArr=@[@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg",@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg"];
    pcv.imgTag=tap.view.tag;
    [self.navigationController pushViewController:pcv animated:YES];
}
-(void)seeRecord{
    SeeRecordViewController *sv=[[SeeRecordViewController alloc]init];
    [self.navigationController pushViewController:sv animated:YES];
}
-(void)btnDetail:(UIButton *)sender{
    DetailFriendViewController *vv=[[DetailFriendViewController alloc]init];
    [self.navigationController pushViewController:vv animated:YES];
}
#pragma mark 下面视图的按钮点击代理方法
//购买
-(void)Buy:(UIButton *)sender{
    BuyViewController *buy=[[BuyViewController alloc]init];
    [self.navigationController pushViewController:buy animated:YES];
}
//议价
-(void)changePrice:(UIButton *)sender{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, XDSH)];
    self.backView=view;
    view.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
    [self.view addSubview:view];
   // view.userInteractionEnabled=YES;
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"ChangePriceView" owner:self options:nil];
    ChangePriceView *cp=arr[0];
    self.changePriceView=cp;
    cp.delegate=self;
    cp.layer.cornerRadius=10;
    cp.clipsToBounds=YES;
    cp.bounds=CGRectMake(0,0,310,170);
    cp.center=CGPointMake(XDSW/2.0, XDSH/2.0);
    [view addSubview:cp];
}
//评论
-(void)comment:(UIButton *)sender{
    CommentViewController *cv=[CommentViewController alloc];
    [self.navigationController pushViewController:cv animated:YES];

}
//点赞
-(void)zanClick:(UIButton *)sender{
        UIImage *img=self.zanClickState?[UIImage imageNamed:@"zan00"]:[UIImage imageNamed:@"tubiao0323_08"];
        [sender setBackgroundImage:img forState:UIControlStateNormal];
        self.zanClickState=!self.zanClickState;
}
//分享
-(void)shareClick:(UIButton *)sender{
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
//喜爱
-(void)favoriteClick:(UIButton *)sender{
        UIImage *img=self.favoriteClickState?[UIImage imageNamed:@"cang_cang"]:[UIImage imageNamed:@"cang_cang_1"];
        [sender setBackgroundImage:img forState:UIControlStateNormal];
        self.favoriteClickState=!self.favoriteClickState;
}
//议价的确定按钮
-(void)srue:(UIButton *)sender{
    [self.backView removeFromSuperview];
}
//议价的取消按钮
-(void)chanel:(UIButton *)sender{
    [self.backView removeFromSuperview];
}
#pragma mark tableView代理方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.iconBtn.layer.cornerRadius=15;
    cell.iconBtn.clipsToBounds=YES;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 80;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.changePriceView.priceTextField  resignFirstResponder];
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
