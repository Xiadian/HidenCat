//
//  TalkPriceView.h
//  HidenCat
//
//  Created by XiaDian on 16/4/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TalkPriceDelegate<NSObject>
//确认按钮
-(void)srue:(UIButton *)sender;
//取消按钮
-(void)chanel:(UIButton *)sender;
@end
@interface TalkPriceView : UIView
@property (nonatomic,strong)id<TalkPriceDelegate>delegate;

@end
