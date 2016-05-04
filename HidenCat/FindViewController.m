//
//  FindViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "XDPlayView.h"
#import "DetailViewController.h"
#import <MediaPlayer/MediaPlayer.h>
@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate,XDPlayDelegate>
{
    MPMoviePlayerController *_player;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSArray *vidieoArr;
@property(nonatomic,strong)NSArray *nameArr;
@property(nonatomic,strong)NSArray *picArr;
@property(nonatomic,strong)NSArray *iconPicArr;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self.tabBarController.tabBar addObserver:self forKeyPath:@"selectedItem" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if (_player) {
        [self stopPlay];
    }
}
//基本配置
-(void)config{
    self.navigationItem.title=@"发现";
    [self.tableView registerNib:[UINib nibWithNibName:@"FindTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    self.picArr=@[@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan1.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan6.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan2.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan3.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan4.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan3.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan2.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan1.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan3.jpg",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoyulan4.jpg"];
    self.vidieoArr=@[@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoQQ20160314112239.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaocangmaomao_video.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoQQ20160314112222.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoimg7910.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoimg7909.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoimg7907.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoQQ20160314112222.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoQQ20160314112239.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoimg7907.mp4",@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoimg7909.mp4"];
    self.nameArr=@[@"小喵喵",@"夏天",@"爱丽丝",@"腾格尔",@"史密斯",@"爱丽丝",@"腾格尔",@"史密斯",@"腾格尔",@"史密斯"];
    self.iconPicArr=@[@"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg",
                  @"http://image.dreamshuo.com/images/t016834f9c1e4a557ea.jpg",
                  @"http://image.dreamshuo.com/images/t0174fe402905794b59.png",
                  @"http://image.dreamshuo.com/images/t012fe21fe1f67bff03.jpg",
                  @"http://image.dreamshuo.com/images/t01546a090c9a5b6f91.png",
                  @"http://image.dreamshuo.com/images/t01175ebf418250df7e.jpg"];

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -tableview代理
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.picArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 495;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.TopbackView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.3];
    cell.iconBtn.layer.cornerRadius=25;
    cell.iconBtn.clipsToBounds=YES;
    [cell.iconBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.iconPicArr[indexPath.row]] forState:UIControlStateNormal];
    cell.nameLabel.text=self.nameArr[indexPath.row];
    NSString *ss=self.picArr[indexPath.row];
    cell.delegate=self;
    cell.imgeView.userInteractionEnabled=YES;
    [cell.imgeView sd_setImageWithURL:[NSURL URLWithString:ss]];
    return  cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
        CATransition *tra=[CATransition animation];
        tra.duration=1.0f;
        tra.type=@"uckEffect";
        [cell.layer addAnimation:tra forKey:nil];
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    FindTableViewCell *cellone=(id)cell;
    for (UIView *view in cellone.playView.subviews) {
        if (view==_player.view) {
            [self stopPlay];

        }
    }
}
#pragma mark 发现页view的代理方法
-(void)pushTodetail{
    if (_player) {
        [self stopPlay];
    }
    DetailViewController *dv=[[DetailViewController alloc]init];
    dv.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:dv animated:YES];
}
-(void)playVideoWithIN:(FindTableViewCell *)cell{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    if (_player) {
        [self stopPlay];

        NSIndexPath *indexPath=[self.tableView indexPathForCell:cell];
        NSURL  *url = [NSURL URLWithString:self.vidieoArr[indexPath.row]];
        _player=[[MPMoviePlayerController alloc]initWithContentURL:url];
        _player.controlStyle=MPMovieControlStyleDefault;
        _player.scalingMode=MPMovieScalingModeFill;
        _player.view.frame=CGRectMake(0, 0, cell.playView.bounds.size.width, cell.playView.bounds.size.height);
        [cell.playView addSubview:_player.view];
        [_player prepareToPlay];
        [_player play];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenUp) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    }
    else{
        NSIndexPath *indexPath=[self.tableView indexPathForCell:cell];
        NSURL  *url = [NSURL URLWithString:self.vidieoArr[indexPath.row]];
        _player=[[MPMoviePlayerController alloc]initWithContentURL:url];
        _player.controlStyle=MPMovieControlStyleDefault;
        _player.scalingMode=MPMovieScalingModeFill;
        _player.view.frame=CGRectMake(0, 0, cell.playView.bounds.size.width, cell.playView.bounds.size.height);
        [cell.playView addSubview:_player.view];
        [_player prepareToPlay];
        [_player play];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenUp) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    }
}
//视频播放结束通知
-(void)listenUp{
    if (_player) {
        [self stopPlay];
    }
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
-(void)stopPlay{
    
        [_player pause];
        [_player.view removeFromSuperview];
        _player=nil;
}
#pragma mark 页面生命方法
//-(void)viewWillDisappear:(BOOL)animated{
//
//    [super viewWillDisappear:animated];
//    if (_player) {
//        [self stopPlay];
//
//    }
//}
@end
