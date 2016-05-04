//
//  PhotoBrowserView.m
//  SPH0
//
//  Created by NEW on 15/12/14.
//  Copyright © 2015年 SPH. All rights reserved.
//

#import "PhotoBrowserView.h"

#import "PhotoBrowserScrollView.h"
@interface PhotoBrowserView ()<UIScrollViewDelegate>

//导航条
@property (nonatomic,strong) UIView *backNavigationView;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,strong) NSArray *urlArray;
@property (nonatomic,assign) NSInteger currentIndex;
//计数板
@property (nonatomic,strong) UILabel *numberLabel;
@end
@implementation PhotoBrowserView

- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array andCurrentIndex:(NSInteger)index andVideoUrl:(NSString *)url
{
    self = [super initWithFrame:frame];
    if (self) {
        if(array.count!=0&&array!=nil)
        {
            _urlArray = array;
            _currentIndex=index;
            if(_currentIndex>array.count){
                _currentIndex = 0;
            }
            self.userInteractionEnabled = YES;
            [self createNavigationView];
            self.url=url;
            [self createScrollView];
            [self bringSubviewToFront:_numberLabel];
            self.backgroundColor = [UIColor clearColor];
        }
    }
    return self;
}
/**
 * 创建导航条View
 */
-(void)createNavigationView
{
        _numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,XDSH-60, XDSW, 20)];
        _numberLabel.center = CGPointMake(XDSW/2.0, XDSH-50);
        _numberLabel.backgroundColor=[UIColor blackColor];
        _numberLabel.textColor=[UIColor whiteColor];
        _numberLabel.text=[NSString stringWithFormat:@"%zd/%zd",_currentIndex+1,_urlArray.count];
        _numberLabel.textAlignment=NSTextAlignmentCenter;
        [self  addSubview:_numberLabel];
}

-(void)createScrollView
{
    PhotoBrowserScrollView *allScreeenSV=[[PhotoBrowserScrollView alloc]initWithFrame:CGRectMake(0, 0, XDSW, XDSH)];
    self.photeView=allScreeenSV;
    allScreeenSV.currenIndex = _currentIndex;
    allScreeenSV.arrayUrl = _urlArray;
    allScreeenSV.tag  = 100;
    allScreeenSV.playUrl=self.url;
    allScreeenSV.delegate  = self;
    __weak PhotoBrowserView *BlockSelf =self;
    allScreeenSV.imageClickBlock  = ^{
            if(BlockSelf.backNavigationView.hidden==YES){
                BlockSelf.backNavigationView.hidden=NO;
            }
            else
            {
                BlockSelf.backNavigationView.hidden=YES;
            }
    };
    
    allScreeenSV.zoomChange = ^(CGFloat zoom){
        
        if(zoom<1){
        self.backNavigationView.hidden  =YES;
        }else{
            self.backNavigationView.hidden  =NO;

        }
//        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:zoom/3];

    };

    [self addSubview:allScreeenSV];
}

-(void)backButtonClick:(UIButton *)button
{
    [self removeFromSuperview];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.tag == 100){
        if (scrollView.contentOffset.x>=XDSW) {
            PhotoBrowserScrollView *dd=(PhotoBrowserScrollView *)scrollView;
            if(dd.player){
                [dd.player pause];
                [dd.player.view removeFromSuperview];
                dd.player=nil;
            }
        }
        int index = scrollView.contentOffset.x/scrollView.frame.size.width;
        _numberLabel.text = [NSString stringWithFormat:@"%d/%ld",(index+1),_urlArray.count];
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if(scrollView.tag == 100){
               int index = scrollView.contentOffset.x/scrollView.frame.size.width;
            _numberLabel.text = [NSString stringWithFormat:@"%d/%ld",(index+1),_urlArray.count];
    }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    for (UIView *tempView in scrollView.subviews) {
        if([tempView isKindOfClass:[UIScrollView class]]){
            UIScrollView *sv= (UIScrollView *)tempView;
            [sv setZoomScale:1.0 animated:YES];
        }
    }
}
@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com