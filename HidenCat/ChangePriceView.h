//
//  ChangePriceView.h
//  HidenCat
//
//  Created by XiaDian on 16/4/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangePriceDelegate<NSObject>
//确认按钮
-(void)srue:(UIButton *)sender;
//取消按钮
-(void)chanel:(UIButton *)sender;
@end
@interface ChangePriceView : UIView
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (nonatomic,strong)id<ChangePriceDelegate>delegate;
@end
