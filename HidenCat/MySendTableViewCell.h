//
//  MySendTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MySendDelegate<NSObject>
-(void)edite:(UIButton *)sender;
-(void)resend:(UIButton *)sender;
@end
@interface MySendTableViewCell : UITableViewCell
@property(nonatomic,strong)id<MySendDelegate>delegate;
@end
