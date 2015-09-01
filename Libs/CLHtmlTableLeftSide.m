
//
//  CLHtmlTableLeftSide.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableLeftSide.h"
#import "CLHtmlTableLeftCell.h"


@interface CLHtmlTableLeftSide()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *LeftSideTableView;
}

@end


@implementation CLHtmlTableLeftSide

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCellHeight:(CGRect)frame CellHeight:(CGFloat)height{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.CellHeight = height;
        
        LeftSideTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        LeftSideTableView.delegate=self;
        LeftSideTableView.dataSource=self;
        
        LeftSideTableView.userInteractionEnabled=NO;
        [LeftSideTableView setSeparatorInset:UIEdgeInsetsZero];
        [LeftSideTableView setSeparatorInset:UIEdgeInsetsZero];
        if ([LeftSideTableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [LeftSideTableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([LeftSideTableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [LeftSideTableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
        [self addSubview: LeftSideTableView];
        
        self.table = LeftSideTableView;
    }
    
    NSLog(@"Left:%@",NSStringFromCGRect(frame));
    
    return self;
}



#pragma mark tableview delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate getRowCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"CLTableLeftSideCell";
    CLHtmlTableLeftCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[CLHtmlTableLeftCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.label.frame = CGRectMake(0, 0, self.frame.size.width, self.CellHeight);
    }
    cell.label.text = [self.delegate getFirstRowName:indexPath];    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.CellHeight)];
    [lbl setBackgroundColor:self.HeadBackGroundColor];
    [lbl setTextColor:self.HeadColor];
    [lbl setTextAlignment:NSTextAlignmentCenter];
    lbl.text = [self.delegate getColumnName];
    return lbl;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.CellHeight;
}

@end
