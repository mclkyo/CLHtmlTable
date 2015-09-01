//
//  CLHtmlTableView.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableView.h"
#import "CLHtmlTableLeftSide.h"
#import "CLHtmlTableColumnInfo.h"
#import "CLHtmlTableHead.h"
#import "CLHtmlTableCell.h"

@interface CLHtmlTableView()<CLHtmlTableHeadDelegate,CLHtmlTableLeftSideDelegate,UITableViewDataSource,UITableViewDelegate>{
    CLHtmlTableLeftSide *leftSide;
    CLHtmlTableHead *head;
    UITableView *table;
    UIScrollView *myScrollView;
}
@end


@implementation CLHtmlTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self CommonInit];
        self.HeadBackGroundColor = [UIColor grayColor];
        self.HeadColor = [UIColor whiteColor];
    }
    return self;
}


-(void)ReBuild{
    CLHtmlTableColumnInfo *info = [self.ColumnInfo objectAtIndex:0];
    leftSide.frame = CGRectMake(0, 0, info.Width, self.frame.size.height);
    leftSide.table.frame = CGRectMake(0, 0, info.Width, self.frame.size.height);
    myScrollView.frame =CGRectMake(leftSide.frame.size.width, 0, self.frame.size.width - info.Width, self.frame.size.height);
}


-(void)Build{
    CLHtmlTableColumnInfo *info = [self.ColumnInfo objectAtIndex:0];
    
    head = [[CLHtmlTableHead alloc]initWithFrameAndDelegate:CGRectMake(0, 0, 0, self.CellHeight) Delegate:self];
    [head setBackgroundColor:self.HeadBackGroundColor];
    head.HeadColor = self.HeadColor;
    [head build];
    
    table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, head.TableWidth, self.frame.size.height) style:UITableViewStylePlain];
    table.delegate=self;
    table.dataSource=self;
    table.bounces=NO;
    [table setSeparatorInset:UIEdgeInsetsZero];
    if ([table respondsToSelector:@selector(setSeparatorInset:)]) {
        [table setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([table respondsToSelector:@selector(setLayoutMargins:)]) {
        [table setLayoutMargins:UIEdgeInsetsZero];
    }
    
    leftSide = [[CLHtmlTableLeftSide alloc]initWithCellHeight:CGRectMake(0, 0, info.Width, self.frame.size.height) CellHeight:self.CellHeight];
    leftSide.delegate = self;
    leftSide.HeadColor = self.HeadColor;
    leftSide.HeadBackGroundColor = self.HeadBackGroundColor;
    [self addSubview:leftSide];
    
    UIView *right = [[UIView alloc]initWithFrame:CGRectMake(info.Width, 0, self.frame.size.width - info.Width, self.frame.size.height- 0)];
    //[right setBackgroundColor:[UIColor redColor]];
    right.layer.borderColor = [UIColor redColor].CGColor;
    right.layer.borderWidth = 1;
    //[self addSubview:right];
    
    
    
    myScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(info.Width, 0, self.frame.size.width - info.Width, self.frame.size.height)];
    [myScrollView addSubview:table];
    myScrollView.bounces=NO;
    myScrollView.contentSize = CGSizeMake(head.TableWidth ,0);
    [myScrollView setBackgroundColor:[UIColor redColor]];
    [self addSubview:myScrollView];

    [self setNeedsDisplay];

}


-(void)CommonInit{

}


-(void)ReloadData{
    [leftSide.table reloadData];
    [table reloadData];
}


#pragma marks CLHtmlTableDelegate
-(CLHtmlTableColumnInfo*)getColumnName:(NSUInteger)ColumnIndex{
    return [self.ColumnInfo objectAtIndex:ColumnIndex];
}

-(NSUInteger)getColumnCount{
    return self.ColumnInfo.count;
}

-(CGFloat)getHeight{
    return self.CellHeight;
}

#pragma marks CLHtmlTableLeftSideDelegate

-(NSString*)getColumnName{
    CLHtmlTableColumnInfo *info = [self.ColumnInfo objectAtIndex:0];
    return info.ColumnName;
}

-(NSString*)getFirstRowName:(NSIndexPath *)path{
    return [self.delegate getFirstRowName:path];
}

-(NSUInteger)getRowCount{
    return [self.delegate getCount];
}


#pragma marks table view delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.delegate getCount];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"CLHtmlTableCell";
    CLHtmlTableCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        
        cell=[[CLHtmlTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier ColumnsInfo:self.ColumnInfo];
        cell.CellHeight = self.CellHeight;
    }
    
    
    for(int i=0;i<self.ColumnInfo.count-1;i++){
        [cell FillData:i CellContent:[self.delegate getCellContent:indexPath ColumnIndex:i+1] IndexPath:indexPath];
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return head;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.CellHeight;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY= table.contentOffset.y;
    CGPoint leftOffset = leftSide.table.contentOffset;
    leftOffset.y=offsetY;
    leftSide.table.contentOffset = leftOffset;
    if(offsetY==0){
        leftSide.table.contentOffset=CGPointZero;
    }
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if([self.delegate respondsToSelector:@selector(DidSelect:)]){
        [self.delegate DidSelect:indexPath];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
