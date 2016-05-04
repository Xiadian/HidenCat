//
//  CitySelectPickView.h
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CitySelectDelegate<NSObject>
-(void)surClick:(UIButton *)sender getText:(NSString *)areaText;
-(void)canelClick:(UIButton *)sender;
@end
@interface CitySelectPickView : UIView<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *cityHeadLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property(nonatomic,strong)id <CitySelectDelegate>delegate;
@property (nonatomic,assign) NSInteger areaArrIndex;
@property (nonatomic,assign) NSInteger cityArrIndex;
@property (nonatomic,assign) NSInteger thirdArrIndex;


//省 数组
@property (strong, nonatomic) NSArray *provinceArr;
//城市 数组
@property (strong, nonatomic) NSArray *cityArr;
//区县 数组
@property (strong, nonatomic) NSArray *areaArr;
//地区字典
@property(nonatomic,strong)NSDictionary *areaDic;
@end
