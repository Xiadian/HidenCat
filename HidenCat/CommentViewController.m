//
//  CommentViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/29.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "CommentViewController.h"
#import "DetailTableViewCell.h"
@interface CommentViewController ()<UITextViewDelegate>
@end
@implementation CommentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self keyBoardConfig];
    [self config];
    }
-(void)config{
    self.navigationItem.title=@"评论";
    self.commentTextField.delegate=self;
    self.sendBtn.layer.cornerRadius=5;
    self.sendBtn.clipsToBounds=YES;
    self.commentTextField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"xd"];
}
-(void)keyBoardConfig{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark-keyboard
-(void)keyBoardHide:(NSNotification *)noti{
    CGFloat duration=[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.buttomConstraint.constant=0.0f;
        [self.view layoutIfNeeded];
    } completion:nil];
}
-(void)keyBoardShow:(NSNotification *)noti{
        CGFloat height=[[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
        CGFloat  duration=[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
        [UIView animateWithDuration:duration animations:^{
            self.buttomConstraint.constant=height;
            [self.view layoutIfNeeded];
        } completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.commentTextField  resignFirstResponder];
}

#pragma mark tableView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xd" forIndexPath:indexPath];
    cell.iconBtn.layer.cornerRadius=15;
    cell.iconBtn.clipsToBounds=YES;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    return 80;
}
- (IBAction)sendClick:(UIButton *)sender {
    
}
- (void)textViewDidChange:(UITextView *)textView{
    if (self.ViewHeightContraint.constant>200) {
        self.ViewHeightContraint.constant=201;
    }
    else{
        self.ViewHeightContraint.constant=40+textView.contentSize.height-30;
    }

}
@end
