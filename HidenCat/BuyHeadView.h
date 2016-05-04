//
//  BuyHeadView.h
//  HidenCat
//
//  Created by XiaDian on 16/4/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol BuyHeadViewDelegate<NSObject>
-(void)buyClick:(UIButton *)btn;
@end
@interface BuyHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *BuyBtn;
@property (weak, nonatomic) IBOutlet UILabel *payTitile;
@property(nonatomic,strong)id<BuyHeadViewDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *payChangeLabel;
@end
