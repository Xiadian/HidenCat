//
//  MineTableViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MineTableViewController.h"
#import "MineFirstTableViewCell.h"
#import "MineSecondTableViewCell.h"
#import "MineThirdTableViewCell.h"
#import "MineCellModel.h"
#import "CatMoneyViewController.h"
#import "SettingTableViewController.h"
#import "MySettingTableViewController.h"
#import "MyOrderViewController.h"
#import "MyNewsController.h"
#import "MySendViewController.h"
#import "MyFoucusViewController.h"
@interface MineTableViewController ()
@property(nonatomic,strong)NSArray *mineCellArr;
@end
@implementation MineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
    [self getModel];
}
-(void)getModel{
    NSMutableArray *sectionArr1=[[NSMutableArray alloc]init];
    MineCellModel *s1Model1=[[MineCellModel alloc]init];
    s1Model1.cellImage=@"my_order";
    s1Model1.cellTitle=@"我的订单";
    s1Model1.cellDetail=nil;
    [sectionArr1 addObject:s1Model1];
    MineCellModel *s1Model2=[[MineCellModel alloc]init];
    s1Model2.cellImage=@"my_money1";
    s1Model2.cellTitle=@"我的喵币";
    s1Model2.cellDetail=@"￥1500";
    [sectionArr1 addObject:s1Model2];
    
    NSMutableArray *sectionArr2=[[NSMutableArray alloc]init];
    MineCellModel *s2Model1=[[MineCellModel alloc]init];
    s2Model1.cellImage=@"my_write";
    s2Model1.cellTitle=@"我的发布";
    s2Model1.cellDetail=nil;
    [sectionArr2 addObject:s2Model1];
    MineCellModel *s2Model2=[[MineCellModel alloc]init];
    s2Model2.cellImage=@"my_eyes";
    s2Model2.cellTitle=@"我的关注";
    s2Model2.cellDetail=nil;
    [sectionArr2 addObject:s2Model2];
    MineCellModel *s2Model3=[[MineCellModel alloc]init];
    s2Model3.cellImage=@"message_no";
    s2Model3.cellTitle=@"消息";
    s2Model3.cellDetail=@"5";
    [sectionArr2 addObject:s2Model3];
    
    NSMutableArray *sectionArr=[[NSMutableArray alloc]init];
    [sectionArr addObject:sectionArr1];
    [sectionArr addObject:sectionArr2];
    self.mineCellArr=sectionArr;
}
-(void)config{
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    self.navigationItem.title=@"我";
    [self.tableView registerNib:[UINib nibWithNibName:@"MineFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineSecondTableViewCell" bundle:nil] forCellReuseIdentifier:@"sec"];
     [self.tableView registerNib:[UINib nibWithNibName:@"MineThirdTableViewCell" bundle:nil] forCellReuseIdentifier:@"thrid"];
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(setting)];
    btn.imageInsets=UIEdgeInsetsMake(7, 7, 7, 7);
    btn.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=btn;
}
//设置按钮
-(void)setting{
    SettingTableViewController *ss=[[SettingTableViewController alloc]init];
    ss.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:ss animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==2) {
        return 3;
    }
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    MineFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell" forIndexPath:indexPath];
                     return cell;
                }
                    break;
                case 1:
                {
                    MineSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sec" forIndexPath:indexPath];
                     return cell;
                }
                default:
                break;
            }
       }
        break;
        case 1:{
            MineThirdTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"thrid" forIndexPath:indexPath];
            MineCellModel *model=self.mineCellArr[0][indexPath.row];
            cell.imgView.image=[UIImage imageNamed:model.cellImage];
            cell.title.text=model.cellTitle;
            cell.detail.text=model.cellDetail;
            return cell;
        }
            break;
        default:
        {
            MineThirdTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"thrid" forIndexPath:indexPath];
            MineCellModel *model=self.mineCellArr[1][indexPath.row];
            cell.imgView.image=[UIImage imageNamed:model.cellImage];
            cell.title.text=model.cellTitle;
            cell.detail.text=model.cellDetail;
            return cell;
        }
            break;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"third" forIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    return 100;
                }
                    break;
                case 1:
                {
                    return 80;
                }
                default:
                    break;
            }
        }
            break;
            
        default:
             return 60;
            break;
    }
    return 60;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {   //我的资料
                    MySettingTableViewController *mm=[[MySettingTableViewController alloc]init];
                    mm.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:mm animated:YES];

                }
                    break;
                case 1:
                {
                    
                }
                default:
                    break;
            }
        }
            break;
        case 1:{
            switch (indexPath.row) {
                case 0:
                {   //我的订单页面
                    MyOrderViewController *mo=[[MyOrderViewController alloc]init];
                    mo.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:mo animated:YES];
                }
                    break;
                    //喵币页面
                case 1:
                {  CatMoneyViewController *cc=[[CatMoneyViewController alloc]init];
                    cc.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:cc animated:YES];
                
                }
                    break;
                    

                default:
                    break;
            }
            

            
                }
            break;
        case 2:{
            switch (indexPath.row) {
                case 0:
                {//我的发布界面
                    MySendViewController *mn=[[MySendViewController alloc]init];
                    mn.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:mn animated:YES];

                }
                    break;
                case 1:
                //我的关注页面
                {  MyFoucusViewController *mn=[[MyFoucusViewController alloc]init];
                    mn.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:mn animated:YES];
                }
                    break;
                case 2:
                {//我的消息界面
                    MyNewsController *mn=[[MyNewsController alloc]init];
                    mn.hidesBottomBarWhenPushed=YES;
                    [self.navigationController pushViewController:mn animated:YES];
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
        default:
        {
           
        }
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
