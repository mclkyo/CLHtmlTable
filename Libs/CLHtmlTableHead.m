//
//  CLHtmlTableHead.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableHead.h"
#import "CLHtmlTableColumnInfo.h"


@implementation CLHtmlTableHead

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrameAndDelegate:(CGRect)frame Delegate:(id<CLHtmlTableHeadDelegate>)delegate{
    
    self = [super initWithFrame:frame];
    if(self){
        self.delegate = delegate;
    }
    return self;
}


-(void)build{
    int Start = 0;
    for(int i=0;i<[self.delegate getColumnCount];i++){
        CLHtmlTableColumnInfo *column = [self.delegate getColumnName:i];
        if(i==0)
            continue;
        
        UIView *head = [[UIView alloc]initWithFrame:CGRectMake(Start, 0, column.Width, [self.delegate getHeight])];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, head.frame.size.width, head.frame.size.height)];
        [label setTextAlignment:NSTextAlignmentCenter];
        label.text = column.ColumnName;
        [label setTextColor:self.HeadColor];
        [head addSubview:label];
        
        [self addSubview:head];
        self.TableWidth += column.Width;
        Start += column.Width;
    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.TableWidth, self.frame.size.height);
}


@end
