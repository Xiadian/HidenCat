//
//  AddressGetViewControllerViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "AddressGetViewControllerViewController.h"
#import "MyFoucusTableViewCell.h"
#import "AddressGetTableViewCell.h"
#import "AddAdressViewController.h"
@interface AddressGetViewControllerViewController ()<AddressGetDelegate>

@end

@implementation AddressGetViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"收货地址";
    [self.tableView registerNib:[UINib nibWithNibName:@"AddressGetTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressGetTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.delegate=self;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)edict:(UIButton *)sender{
    AddAdressViewController *av=[[AddAdressViewController alloc]init];
    av.navaTitle=@"修改收货地址";
    [self.navigationController pushViewController:av animated:YES];

}
- (IBAction)addAdressClick:(id)sender {
    AddAdressViewController *av=[[AddAdressViewController alloc]init];
    av.navaTitle=@"新建收货地址";
    [self.navigationController pushViewController:av animated:YES];
}

@end
