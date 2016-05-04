//
//  HidenCatView.h
//  HidenCat
//
//  Created by XiaDian on 16/4/5.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HidenCatDelegate<NSObject>
-(void)play;
-(void)saveEnd:(UIButton *)btn;
@end
@interface HidenCatView : UIView
@property(nonatomic,strong)id <HidenCatDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@end
