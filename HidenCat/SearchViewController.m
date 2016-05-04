//
//  SearchViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UISearchBar *searchBar;
@property(nonatomic,strong)UITableView *searchResult;
@property (nonatomic,strong) NSMutableArray *nameArray;
@property (nonatomic,strong) NSMutableArray *result;
-(void)initSearchBar;//创建搜索
-(void)initTableView;//创建搜索结果的示意图

@end

@implementation SearchViewController

-(NSMutableArray *)result{
    if (!_result) {
        self.result = [NSMutableArray array];
    }
    return _result;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameArray = [@[@"闪闪发光",@"商量等产",@"小情人",@"小歌手",@"爱人",@"爱着你",@"王大妈",@"王阿姨",@"我爱你",@"我爱猪",@"你是猪",@"你是人吗",@"啦啦啦",@"爱我吗",@"爱吗",@"爱不爱",@"不爱",@"爱人他",@"爱人妈"] mutableCopy];
    self.navigationItem.title=@"搜索";
    [self initSearchBar];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)initSearchBar{
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 64,XDSW,44)];
    _searchBar.keyboardType = UIKeyboardTypeDefault;
    _searchBar.placeholder = @"请输入搜索关键字";
    _searchBar.delegate = self;
    _searchBar.barTintColor = [UIColor colorWithRed:255/255.0 green:101/255.0 blue:102/255.0 alpha:1];
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    _searchBar.barStyle = UIBarStyleDefault;
    [self.view addSubview:_searchBar];
}

- (void)initTableView{
    self.searchResult = [[UITableView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.searchBar.frame),XDSW, XDSH-64-CGRectGetHeight(self.searchBar.frame))];
    _searchResult.dataSource = self;
    _searchResult.delegate =self;
    _searchResult.tableFooterView = [[UIView alloc]init];
    [_searchResult registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.searchResult];
    
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = YES;//取消的字体颜色，
    [searchBar setShowsCancelButton:YES animated:YES];
    [self initTableView];
    //改变取消的文本
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            [cancel setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }
}
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    NSLog(@"我的");
}
/**
 *  搜框中输入关键字的事件响应
 *
 *  @param searchBar  UISearchBar
 *  @param searchText 输入的关键字
 */
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    
    NSLog(@"输入的关键字是---%@---%lu",searchText,(unsigned long)searchText.length);
    self.result = nil;
    for (int i = 0; i < self.nameArray.count; i++) {
        NSString *string = self.nameArray[i];
        if (string.length >= searchText.length) {
            NSString *str = [self.nameArray[i] substringWithRange:NSMakeRange(0, searchText.length)];
            if ([str isEqualToString:searchText]) {
                [self.result addObject:self.nameArray[i]];
            }
        }
    }
    [self.searchResult reloadData];
    
}

/**
 *  取消的响应事件
 *
 *  @param searchBar UISearchBar
 */
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

/**
 *  键盘上搜索事件的响应
 *
 *  @param searchBar UISearchBar
 */
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
}


/**
 *  UITableView的三个代理
 *
 *
 *  @return 行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.result.count;
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.result[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
}
@end

