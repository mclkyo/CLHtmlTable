//
//  CLHtmlTableCell.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableCell.h"
#import "CLHtmlTableColumnInfo.h"

@interface CLHtmlTableCell(){
    NSMutableArray *lblSubViews;
}

@end



@implementation CLHtmlTableCell

- (void)awakeFromNib {
    // Initialization code
}



-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ColumnsInfo:(NSMutableArray *)columns{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        int Start = 0;
        lblSubViews = [[NSMutableArray alloc]init];
        for (int i=0; i<columns.count; i++) {
            if(i==0){
                continue;
            }
            
            CLHtmlTableColumnInfo *column = [columns objectAtIndex:i];
            if(column.IsCustomerView == NO){
                UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(Start, 0, column.Width , self.frame.size.height)];
                [label setTextAlignment:NSTextAlignmentCenter];
                
                [lblSubViews addObject:label];
                [self.contentView addSubview:label];
            }
            else{                
                UIView *SubView = column.block();
                SubView.frame = CGRectMake(Start, 0, column.Width, self.frame.size.height);
                
                
                [self.contentView addSubview:SubView];
                
                [lblSubViews addObject:SubView];
            }
 
            
            Start += column.Width;
        }
    }
    return self;
}

-(void)FillData:(NSUInteger)columnIndex CellContent:(NSString *)content{

}

-(void)FillData:(NSUInteger)columnIndex CellContent:(NSString *)content IndexPath:(NSIndexPath *)indexPath{
    UIView *sub = [lblSubViews objectAtIndex:columnIndex];
    if([sub isKindOfClass:[UILabel class]]){
        UILabel *label = (UILabel*)sub;
        label.text = content;
    }
    else{
        sub.tag = indexPath.row;
    }
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
