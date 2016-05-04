//
//  TableViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MySettingTableViewController.h"
#import "MySettingTableViewCell.h"
#import "SexChangeViewController.h"
#import "PhoneChangeViewController.h"
#import "NameChangeViewController.h"
#import "SignViewController.h"
#import "BDImagePicker.h"
#import "AddressGetViewControllerViewController.h"
#import "GetIdentifyViewController.h"
#import "CitySelectPickView.h"
#import "QRViewController.h"
@interface MySettingTableViewController ()<CitySelectDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *settingTitleArr;
@property(nonatomic,strong)NSMutableArray *detailArr;
@property(nonatomic,strong)NSMutableArray *picArr;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *CityView;
@end

@implementation MySettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.settingTitleArr=[[NSMutableArray alloc]initWithArray:@[@"头像",@"昵称",@"性别",@"地区",@"我的二维码",@"签名",@"修改绑定手机",@"申请认证",@"收货地址",@"我的喵号"]];
    self.detailArr=[[NSMutableArray alloc]initWithArray:@[@"",@"小猫咪",@"女",@"北京 朝阳区",@"",@"爱生活爱古玩爱自己!",@"188****8888",@"未认证",@"",@"10010"]];
    self.picArr=[[NSMutableArray alloc]initWithArray:@[[UIImage imageNamed:@"square_girl2"],[UIImage imageNamed:@"erweima"]]];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0,XDSW, XDSH) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
     [self.tableView registerNib:[UINib nibWithNibName:@"MySettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
    [self.view addSubview:self.tableView];
    
self.navigationItem.title=@"修改资料";
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, -5, 8, 21);
    self.navigationItem.leftBarButtonItem=btnBack;
    self.tableView.bounces=NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            return 80;
            break;
            
        default:
            return 60;
            break;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        MySettingTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    if (indexPath.row==0||indexPath.row==4) {
        switch (indexPath.row) {
            case 0:
            {
             cell.img.image=self.picArr[0];
            }
                break;
            case 4:
            {
             cell.img.image=self.picArr[1];
            }
                break;
            default:
                break;
        }
    }
    if (indexPath.row==4) {
        cell.imgWidth.constant=25;
        cell.imgHeight.constant=25;
        
    }
        cell.titieLabel.text=self.settingTitleArr[indexPath.row];
        cell.detailLB.text=self.detailArr[indexPath.row];
        return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
        {//修改头像
            [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
                if (image) {
                    [self.picArr removeObjectAtIndex:0];
                    [self.picArr insertObject:image atIndex:0];
                    [self.tableView reloadData];
                }
            }];
        }
            break;
            
        case 1:
        {//修改昵称
            NameChangeViewController *name=[[NameChangeViewController alloc]init];
            name.name=self.detailArr[1];
            [name setNameBlock:^(NSString *name) {
                [self.detailArr removeObjectAtIndex:1];
                [self.detailArr insertObject:name atIndex:1];
                [self.tableView reloadData];
             }];
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
        
        case 2:
        {//性别
            SexChangeViewController *sex=[[SexChangeViewController alloc]init];
            //如果为男sex的值为1
            sex.sex=[self.detailArr[2] isEqualToString:@"男"];
            [sex setSexBlock:^(NSString *sex) {
            [self.detailArr removeObjectAtIndex:2];
            [self.detailArr insertObject:sex atIndex:2];
               [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:sex animated:YES];
        
        }
            break;
        case 3:
        {//地区
            NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"CitySelectPickView" owner:self                 options:nil];
            CitySelectPickView *citySelectView=arr[0];
            citySelectView.delegate=self;
            self.CityView=[[UIView alloc]initWithFrame:self.view.frame];
            self.CityView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];;
            citySelectView.frame=CGRectMake(0, XDSH-250,XDSW,250);
            [self.CityView addSubview:citySelectView];
            [self.view addSubview:self.CityView];
        }
            break;
        case 4:
        {//二维码
           QRViewController  *qr=[[QRViewController alloc]init];
         [self.navigationController pushViewController:qr animated:YES];

        }
            break;
        case 5:
        {//修改绑定手机
            SignViewController *sign=[[SignViewController alloc]init];
            sign.sign=self.detailArr[5];
            [sign setSignBlock:^(NSString *sign) {
                [self.detailArr removeObjectAtIndex:5];
                [self.detailArr insertObject:sign atIndex:5];
                [self.tableView reloadData];
            }];
            [self.navigationController pushViewController:sign animated:YES];
        }
            break;
        case 6:
        {//修改绑定手机
            PhoneChangeViewController *phone=[[PhoneChangeViewController alloc]init];
            [self.navigationController pushViewController:phone animated:YES];
            
        }
            break;
        case 7:
        {//申请认证
            GetIdentifyViewController *gi=[[GetIdentifyViewController alloc]init];
            [self.navigationController pushViewController:gi animated:YES];
            
        }
            break;
        case 8:
        {//收货地址
            AddressGetViewControllerViewController *ad=[[AddressGetViewControllerViewController alloc]init];
            [self.navigationController pushViewController:ad animated:YES];
        }
            break;
            
        default:
            break;
    }
}
-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    MySettingTableViewCell *cellon=(id)cell;
    cellon.detailLB.text=@"";
    cellon.img.image=nil;
}
#pragma mark 选择地区的代理方法

-(void)surClick:(UIButton *)sender getText:(NSString *)areaText{
    NSArray *arr=[areaText componentsSeparatedByString:@" "];
    NSString *text=[NSString stringWithFormat:@"%@ %@",arr[1],arr[2]];
    [self.detailArr removeObjectAtIndex:3];
    [self.detailArr insertObject:text atIndex:3];
    [self.tableView reloadData];
    [self.CityView removeFromSuperview];
}
-(void)canelClick:(UIButton *)sender{
    [self.CityView removeFromSuperview];

}
@end
