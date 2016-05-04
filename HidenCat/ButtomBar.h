//
//  ButtomBar.h
//  HidenCat
//
//  Created by XiaDian on 16/3/31.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtomBarDelegate<NSObject>
//议价
-(void)changePrice:(UIButton *)sender;
//购买
-(void)Buy:(UIButton *)sender;
//评论
-(void)comment:(UIButton *)sender;
//点赞
-(void)zanClick:(UIButton *)sender;
//分享
-(void)shareClick:(UIButton *)sender;
//喜爱
-(void)favoriteClick:(UIButton *)sender;
@end
@interface ButtomBar : UIView
@property(nonatomic,strong)id<ButtomBarDelegate>delegate;
@property(nonatomic,assign)BOOL favoriteClickState;
@property(nonatomic,assign)BOOL zanClickState;
@end
