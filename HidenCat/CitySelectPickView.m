//
//  CitySelectPickView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//
#import "CitySelectPickView.h"

@implementation CitySelectPickView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib{
    [self getData];
}
-(void)getData{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"area" ofType:@"plist"];
    self.areaDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    
    NSArray *components = [self.areaDic allKeys];
    NSArray *sortedArray = [components sortedArrayUsingComparator: ^(id obj1, id obj2) {
        
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    
    NSMutableArray *provinceTmp = [[NSMutableArray alloc] init];
    for (int i=0; i<[sortedArray count]; i++) {
        NSString *index = [sortedArray objectAtIndex:i];
        NSArray *tmp = [[self.areaDic objectForKey: index] allKeys];
        [provinceTmp addObject: [tmp objectAtIndex:0]];
    }
    
    self.provinceArr = [[NSArray alloc] initWithArray: provinceTmp];
    NSString *index = [sortedArray objectAtIndex:0];
    NSString *selected = [self.provinceArr objectAtIndex:0];
    NSDictionary *dic = [NSDictionary dictionaryWithDictionary: [[self.areaDic objectForKey:index]objectForKey:selected]];
    
    NSArray *cityArray = [dic allKeys];
    NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
    self.cityArr = [[NSArray alloc] initWithArray: [cityDic allKeys]];
    NSString *selectedCity = [self.cityArr objectAtIndex: 0];
    self.areaArr= [[NSArray alloc] initWithArray: [cityDic objectForKey: selectedCity]];
    self.pickerView.delegate=self;
    self.pickerView.dataSource=self;
    self.thirdArrIndex=0;
    self.cityArrIndex=0;
    self.areaArrIndex=0;
    self.cityHeadLabel.text=[NSString stringWithFormat:@"%@ %@ %@",self.provinceArr[self.areaArrIndex],self.cityArr[self.cityArrIndex],self.areaArr[self.thirdArrIndex]];
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch (component) {
        case 0:
            return self.provinceArr.count;
            break;
        case 1:
            return self.cityArr.count;
            break;
        case 2:
            if (self.areaArr.count) {
                return self.areaArr.count;
                break;
            }
        default:{
         return 0;
        }
            break;
    }
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    switch (component) {
        case 0:
        {
            return [self.provinceArr objectAtIndex:row];
        }
            break;
        case 1:
        {
              return [self.cityArr objectAtIndex:row];
        }
            break;
        case 2:
        {
            if (self.areaArr.count) {
                return [self.areaArr objectAtIndex:row];
                break;
            }
        }
            break;
        default:
             return  @"";
            break;
    }
    return nil;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment=NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:19]];
        
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component) {
        case 0:
        {
            NSDictionary *dic=[self.areaDic objectForKey:[NSString stringWithFormat:@"%zd",row]];
            NSArray *cityArray = [dic allKeys];
            self.areaArrIndex=row;
            NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
            NSMutableArray *cityTemp=[[NSMutableArray alloc]init];
            NSArray *cityKeyArr=[cityDic allKeys];
            NSArray *sortedArray = [cityKeyArr sortedArrayUsingComparator: ^(id obj1, id obj2) {
                
                if ([obj1 integerValue] > [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedDescending;
                }
                
                if ([obj1 integerValue] < [obj2 integerValue]) {
                    return (NSComparisonResult)NSOrderedAscending;
                }
                return (NSComparisonResult)NSOrderedSame;
            }];
            for (NSString *dd in sortedArray) {
                [cityTemp addObject:[[cityDic objectForKey:dd] allKeys][0]];
            }
            self.cityArr=[[NSArray alloc]initWithArray:cityTemp];
            NSDictionary *ddd=[cityDic objectForKey:@"0"];
            NSArray *arr=[ddd objectForKey:[ddd allKeys][0]];
            self.areaArr=[[NSArray alloc]initWithArray:arr];
            [self.pickerView selectRow: 0 inComponent: 1 animated: YES];
            [self.pickerView selectRow: 0 inComponent: 2 animated: YES];
            [self.pickerView reloadComponent: 1];
            [self.pickerView reloadComponent: 2];
              self.cityHeadLabel.text=[NSString stringWithFormat:@"%@ %@ %@",self.provinceArr[self.areaArrIndex],self.cityArr[0],self.areaArr[0]];
        }
            break;
        case 1:
        {
            NSDictionary *dic=[self.areaDic objectForKey:[NSString stringWithFormat:@"%zd",self.areaArrIndex]];
            self.cityArrIndex=row;
            NSArray *cityArray = [dic allKeys];
            NSDictionary *cityDic = [NSDictionary dictionaryWithDictionary: [dic objectForKey: [cityArray objectAtIndex:0]]];
            NSDictionary *ddd=[cityDic objectForKey:[NSString stringWithFormat:@"%zd",row]];
            NSArray *arr=[ddd objectForKey:[ddd allKeys][0]];
            self.areaArr=[[NSArray alloc]initWithArray:arr];
            [self.pickerView selectRow: 0 inComponent: 2 animated: YES];
            [self.pickerView reloadComponent: 2];
              self.cityHeadLabel.text=[NSString stringWithFormat:@"%@ %@ %@",self.provinceArr[self.areaArrIndex],self.cityArr[self.cityArrIndex],self.areaArr[0]];
        }
            break;
        case 2:
        {
            self.thirdArrIndex=row;
            self.cityHeadLabel.text=[NSString stringWithFormat:@"%@ %@ %@",self.provinceArr[self.areaArrIndex],self.cityArr[self.cityArrIndex],self.areaArr[self.thirdArrIndex]];
        }
            break;
        default:
            break;
    }
}
- (IBAction)sureClick:(id)sender {
    [self.delegate surClick:sender getText:self.cityHeadLabel.text];
}
- (IBAction)canelClick:(id)sender {
    [self.delegate canelClick:sender];
}
@end
