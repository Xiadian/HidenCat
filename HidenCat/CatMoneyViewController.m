//
//  CatMoneyViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/25.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "CatMoneyViewController.h"
#import "CatMoneyTopView.h"
#import "MyMenuViewController.h"
@interface CatMoneyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *topView;
@end

@implementation CatMoneyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self config];
}
-(void)config{
    self.navigationItem.title=@"我的喵币";
    self.tableView.bounces=YES;
    UIView *aa=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,200)];
        NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"CatMoneyTopView" owner:self options:nil];
    CatMoneyTopView *top=arr[0];
    top.opaque=NO;
    top.backgroundColor=[UIColor colorWithRed:255/255.0 green:101/255.0 blue:102/255.0 alpha:1];
    top.frame= CGRectMake(0, 0,aa.bounds.size.width, 200);
    [aa addSubview:top];
    self.tableView.tableHeaderView=aa;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"xd"];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.row) {
        case 0:
        { cell.textLabel.text=@"我的账单";
        }
            break;
        case 1:
        { cell.textLabel.text=@"修改提现账号";
        }
            break;
        case 2:
        { cell.textLabel.text=@"设置支付密码";
        }
            break;
        default:
            break;
    }
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {
            MyMenuViewController *mc=[MyMenuViewController alloc];
            [self.navigationController pushViewController:mc animated:YES];
        }
            break;
        case 1:
        {
        }
            break;
        case 2:
        {
        }
            break;
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
