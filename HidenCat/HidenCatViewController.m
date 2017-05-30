

//
//  HidenCatViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "HidenCatViewController.h"
#import "MainTabBarViewController.h"
#import "RecordViewController.h"
#import "XDGetFilePath.h"
#import "NewPlayViewController.h"
@interface HidenCatViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UIButton *btnLeft;
@property(nonatomic,strong)UIButton *btnRight;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,assign)BOOL isNextPage;
@end
@implementation HidenCatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
       self.view.userInteractionEnabled=YES;
    [self btnCreate];
}
//创建中间弹出俩个按钮
-(void)btnCreate{
    self.btnLeft=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-90,[UIScreen mainScreen].bounds.size.height, 180, 180)];
    [self.btnLeft setBackgroundImage:[UIImage imageNamed:@"fabu_03"] forState:UIControlStateNormal];
    [self.btnLeft addTarget:self action:@selector(cording:) forControlEvents:UIControlEventTouchUpInside];
    [self addAnimationLeft];
    [self.view addSubview:self.btnLeft];
    self.btnRight=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-60, [UIScreen mainScreen].bounds.size.height, 120, 120)];
    [self.btnRight setBackgroundImage:[UIImage imageNamed:@"fabu_07"] forState:UIControlStateNormal];
    [self.btnRight addTarget:self action:@selector(newPlay:) forControlEvents:UIControlEventTouchUpInside];
    [self addAnimationRight];
    [self.view addSubview:self.btnRight];
}
-(void)addAnimationLeft{
    /** 添加动画 */
    POPSpringAnimation *anima = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    anima.fromValue = [NSValue valueWithCGRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-90,[UIScreen mainScreen].bounds.size.height, 180, 180)];
    anima.toValue =[NSValue valueWithCGRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-90,[UIScreen mainScreen].bounds.size.height-400, 180, 180)];
    anima.springSpeed = 2;
    anima.springBounciness = 16;
    anima.beginTime = CACurrentMediaTime() ;
    [self.btnLeft pop_addAnimation:anima forKey:nil];
    [anima setCompletionBlock:^(POPAnimation *anima, BOOL finish) {
    }];
}
-(void)addAnimationRight{
    /** 添加动画 */
    POPSpringAnimation *anima = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    anima.fromValue = [NSValue valueWithCGRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-60,[UIScreen mainScreen].bounds.size.height, 120, 120)];
    anima.toValue =[NSValue valueWithCGRect:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-60,[UIScreen mainScreen].bounds.size.height-200 , 120, 120)];
    anima.springSpeed = 2;
    
    anima.springBounciness = 16;
    
    anima.beginTime = CACurrentMediaTime();
    
    [self.btnRight pop_addAnimation:anima forKey:nil];

    [anima setCompletionBlock:^(POPAnimation *anima, BOOL finish) {

    }];
}
//记录按钮
- (void)cording:(UIButton *)sender {
    self.isNextPage=YES;
    NewPlayViewController *cc=[[NewPlayViewController alloc]init];
    cc.hidesBottomBarWhenPushed=YES;
    //跳转到拍摄页面
    [self.navigationController pushViewController: cc animated:YES];
}
//发布按钮
- (void)newPlay:(UIButton *)sender {
    self.isNextPage=YES;
    RecordViewController *dd=[[RecordViewController alloc]init];
    dd.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:dd animated:YES];
}
//触边回弹效果
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MainTabBarViewController *tt=(id)self.tabBarController;
    self.tabBarController.selectedIndex=tt.originNumber;
}
#pragma mark 生命周期方法
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear: animated];
    [UIApplication sharedApplication].statusBarHidden=NO;
    self.isNextPage=NO;
    self.navigationController.navigationBar.hidden=YES;
    [self addAnimationRight];
    [self addAnimationLeft];
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:YES];
    if (self.isNextPage) {
        //如到时跳到其他页面不做处理
    }
    else{
    MainTabBarViewController *tt=(id)self.tabBarController;
    tt.btnClick=!tt.btnClick;
    for (UIView *view in tt.tabBar.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [UIView animateWithDuration:0.3 animations:^{
                self.btn=(id)view;
                CATransform3D t=self.btn.layer.transform;
                self.btn.layer.transform=CATransform3DRotate(t, M_PI_2, 0, 0, 1);
            } completion:^(BOOL finished) {
                [self.btn setBackgroundImage:[UIImage imageNamed:@"centerOne"] forState:UIControlStateNormal];
            }];
        }
    }}
}
@end
