//
//  SettingTableViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//
#import "ChangePassWordViewController.h"
#import "SettingTableViewController.h"
@interface SettingTableViewController ()
@property(nonatomic,strong)NSArray *settingTitleArr;
@property(nonatomic,strong)NSArray *detailArr;
@end
@implementation SettingTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"设置";
    self.settingTitleArr=@[@"关于藏猫猫",@"给我们评价",@"服务协议",@"用户说明",@"清除缓存",@"修改密码"];
    self.detailArr=@[@"",@"",@"",@"",[NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0],@""];
    self.tableView.bounces=YES;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    btnBack.imageInsets=UIEdgeInsetsMake(8,-5, 8,21);
    self.navigationItem.leftBarButtonItem=btnBack;
    UIView *bb=[[UIView alloc]init];
    bb.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2.0-40,5,80, 40)];
    [bb addSubview:lab];
    bb.backgroundColor=[UIColor whiteColor];
    lab.text=@"退出";
    lab.font=[UIFont systemFontOfSize:20 weight:3];
    lab.textAlignment=NSTextAlignmentCenter;
    lab.textColor=[UIColor colorWithRed:255/255.0 green:75/255.0 blue:76/255.0 alpha:1];
    self.tableView.tableFooterView=bb;
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(outfile)];
    [bb addGestureRecognizer:tap];
    bb.userInteractionEnabled=YES;
}
-(void)outfile{
    NSLog(@"退出");
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
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
    switch (section) {
        case 0:
        {
            return 4;
        }
            break;
            default:
        {
            return 1;
        }
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
               UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"x"];
            if (!cell) {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"x"];
                cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            }
    if (indexPath.section==1) {
        cell.textLabel.text=self.settingTitleArr[4+indexPath.row];
        cell.detailTextLabel.text=self.detailArr[4+indexPath.row];
        return cell;

    }
    else if(indexPath.section==2){
        cell.textLabel.text=self.settingTitleArr[5+indexPath.row];
        cell.detailTextLabel.text=self.detailArr[5+indexPath.row];
        return cell;
    
    }else{
        cell.textLabel.text=self.settingTitleArr[indexPath.row];
        cell.detailTextLabel.text=self.detailArr[indexPath.row];
        return cell;

    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 1:
            switch (indexPath.row) {
                case 0:
                {
                    [[SDImageCache sharedImageCache] clearDisk];
                    [[SDImageCache sharedImageCache] clearMemory];
                    UITableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
                    cell.detailTextLabel.text=[NSString stringWithFormat:@"%.2fM",[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0];
                }
                    break;
                    
                default:
                    break;
            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                {
                    ChangePassWordViewController *cv=[[ChangePassWordViewController alloc]init];
                    cv.navigationItem.title=@"修改密码";
                    [self.navigationController pushViewController:cv animated:YES];
                }
                    break;
                default:
                    break;
            }
            break;
        default:
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"Nib name" bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
