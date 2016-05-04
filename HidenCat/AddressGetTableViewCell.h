//
//  AddressGetTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddressGetDelegate<NSObject>
-(void)edict:(UIButton *)sender;
@end
@interface AddressGetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *edictClick;
@property(nonatomic,strong)id<AddressGetDelegate>delegate;
@end
