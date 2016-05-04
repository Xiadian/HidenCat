
//
//  FriendTopView.m
//  HidenCat
//
//  Created by XiaDian on 16/3/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "FriendTopView.h"

@implementation FriendTopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing
    UIImage *imge=[UIImage imageNamed:@"cang_06"];
    [imge drawInRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
}
@end
