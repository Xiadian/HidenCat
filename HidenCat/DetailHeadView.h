//
//  DetailHeadView.h
//  HidenCat
//
//  Created by XiaDian on 16/3/30.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DetailHeadViewDelegate<NSObject>
-(void)seeRecord;
@end
@interface DetailHeadView : UIView
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UIButton *seeRecord;
@property (strong, nonatomic)id<DetailHeadViewDelegate>delegate;
@end
