

//
//  BigManViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "BigManViewController.h"
#import "DetailFriendViewController.h"
#import "BigManCollectionViewCell.h"
@interface BigManViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIButton *secBtn;

@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *bigManArr;
@property(nonatomic,strong)NSArray *superManArr;
@property(nonatomic,assign)BOOL isLeft;
@end

@implementation BigManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self config];
    [self getData];
    self.isLeft=YES;
    // Do any additional setup after loading the view.
}
//死数据
-(void)getData{
    self.bigManArr=@[@"square_girl5.jpg",@"square_girl2.jpg",@"square_girl7.png",@"square_girl8.png",@"square_girl9.png",@"square_girl10.jpg"];
    self.superManArr=@[@"square_girl1.png",@"square_girl2.jpg",@"square_girl3.png",@"square_girl4.jpg",@"square_girl5.jpg",@"square_girl6.png"];
}
-(void)config{
    self.firstBtn.enabled=NO;
    self.secBtn.enabled=YES;
    [self btnState];
    self.navigationItem.title=@"达人";
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BigManCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"xd"];
    UISwipeGestureRecognizer *swRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swRight)];
    swRight.direction=UISwipeGestureRecognizerDirectionRight;
    [self.collectionView addGestureRecognizer:swRight];
    UISwipeGestureRecognizer *swLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swLeft)];
    swLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.collectionView addGestureRecognizer:swLeft];
    self.collectionView.userInteractionEnabled=YES;
}
//右划
-(void)swRight{
    self.firstBtn.enabled=!self.firstBtn.enabled;
    self.secBtn.enabled=!self.secBtn.enabled;
    self.isLeft=!self.isLeft;
    [self.collectionView reloadData];
}
//左划
-(void)swLeft{
    self.firstBtn.enabled=!self.firstBtn.enabled;
    self.secBtn.enabled=!self.secBtn.enabled;
    self.isLeft=!self.isLeft;
    [self.collectionView reloadData];
}
//上部第二个按钮
- (IBAction)secendClick:(UIButton *)sender {
    sender.enabled=NO;
    self.firstBtn.enabled=YES;
    self.isLeft=NO;
    [self.collectionView reloadData];

}
//上部第二个按钮
- (IBAction)firstClick:(UIButton *)sender {
    sender.enabled=NO;
    self.secBtn.enabled=YES;
    self.isLeft=YES;
    [self.collectionView reloadData];
}
//按钮状态设置
-(void)btnState{
    //选中时属性文本
    NSDictionary *clickDic=@{  NSFontAttributeName : [UIFont systemFontOfSize:17],
                               NSForegroundColorAttributeName : [UIColor redColor],NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    //平常文本
    NSDictionary *normolDic=@{  NSFontAttributeName : [UIFont systemFontOfSize:17],
                                NSForegroundColorAttributeName : [UIColor blackColor],NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:0]};

    NSMutableAttributedString *strOne = [[NSMutableAttributedString alloc] initWithString:@"达人推荐"];
    NSRange strRange = {0,[strOne length]};
    [strOne addAttributes:clickDic range:strRange];
    [self.firstBtn setAttributedTitle:strOne forState:UIControlStateDisabled];

    NSMutableAttributedString *strOneEn = [[NSMutableAttributedString alloc] initWithString:@"达人推荐"];
    NSRange str2Range = {0,[strOneEn length]};
    [strOneEn addAttributes:normolDic range:str2Range];
    [self.firstBtn setAttributedTitle:strOneEn forState:UIControlStateNormal];
    NSMutableAttributedString *strSec = [[NSMutableAttributedString alloc] initWithString:@"名人专家"];
    NSRange str3Range = {0,[strSec length]};
    [strSec addAttributes:clickDic range:str3Range];
    [self.secBtn setAttributedTitle:strSec forState:UIControlStateDisabled];
    
    NSMutableAttributedString *strSecEn = [[NSMutableAttributedString alloc] initWithString:@"名人专家"];
    NSRange str4Range = {0,[strSecEn length]};
    [strSecEn addAttributes:normolDic range:str4Range];
    [self.secBtn setAttributedTitle:strSecEn forState:UIControlStateNormal];
}
#pragma mark -collectionView 的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (_isLeft) {
        return self.bigManArr.count;
    }
    return self.superManArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isLeft) {
        BigManCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"xd" forIndexPath:indexPath];
        cell.imgView.image=[UIImage imageNamed:self.bigManArr[indexPath.row]];
        return cell;
    }
    BigManCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"xd" forIndexPath:indexPath];
    cell.imgView.image=[UIImage imageNamed:self.superManArr[indexPath.row]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width/2-8,[UIScreen mainScreen].bounds.size.width/2-8+20);
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 10, 10, 5);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    CATransition *tra=[CATransition animation];
    tra.duration=0.8f;
    tra.type=@"rippleEffect";
    [cell.layer addAnimation:tra forKey:nil];
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    DetailFriendViewController *cc=[[DetailFriendViewController alloc]init];
    cc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:cc animated:YES];
}
@end
