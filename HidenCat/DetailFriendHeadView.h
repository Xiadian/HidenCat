//
//  DetailFriendHeadView.h
//  HidenCat
//
//  Created by XiaDian on 16/3/30.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DetailFriendHeadViewDelegate<NSObject>
-(void)foucousClick:(UIButton *)btn;
@end
@interface DetailFriendHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *starBtn;
@property(nonatomic,strong)id<DetailFriendHeadViewDelegate>delegate;
@end
