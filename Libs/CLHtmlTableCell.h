//
//  CLHtmlTableCell.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLHtmlTableCell : UITableViewCell

@property(nonatomic,assign)CGFloat CellHeight;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier ColumnsInfo:(NSMutableArray*)columns;

-(void)FillData:(NSUInteger)columnIndex CellContent:(NSString*)content IndexPath:(NSIndexPath*)indexPath;

@end
