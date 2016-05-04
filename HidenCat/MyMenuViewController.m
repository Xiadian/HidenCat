//
//  MyMenuViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/5/3.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyMenuViewController.h"
#import "MyMenuViewTableViewCell.h"
@interface MyMenuViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,assign)NSInteger month;
@property(nonatomic,assign)NSInteger week;
@property(nonatomic,strong)NSArray *weekArr;
@end

@implementation MyMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTime];
   
    // Do any additional setup after loading the view from its nib.
}
-(void)getTime{
    self.weekArr=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyMenuViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    //获取当前时间
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date];
    
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"%@", localeDate);
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth |NSCalendarUnitDay|NSCalendarUnitWeekday;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    self.month=[dateComponent month];
    _week=[dateComponent weekday];
    NSString *weekend=[self.weekArr objectAtIndex:_week-1];
    NSLog(@"%@",weekend);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyMenuViewTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.weekLab.text= [self.weekArr objectAtIndex:_week-indexPath.row-1];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    view.bounds=CGRectMake(0, 0, XDSW, 40);
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, XDSW, 30)];
    [view addSubview:lab];
    switch (section) {
        case 0:
        {
            lab.text=@"本月账单";
        }
            break;
        case 1:
        {
            lab.text=[NSString stringWithFormat:@"%zd月账单",self.month-1];
        }
            break;
        case 2:
        {
            lab.text=[NSString stringWithFormat:@"%zd月账单",self.month-2];
        }
            break;
        case 3:
        {
            lab.text=[NSString stringWithFormat:@"%zd月账单",self.month-3];
        }
            break;
        default:
            break;
    }
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
