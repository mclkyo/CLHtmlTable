//
//  CLHtmlTableLeftSide.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLHtmlTableLeftSideDelegate.h"

@interface CLHtmlTableLeftSide : UIView

@property(nonatomic,assign)CGFloat CellHeight;
@property(nonatomic,assign)id<CLHtmlTableLeftSideDelegate> delegate;
@property(nonatomic,retain)UITableView *table;

@property(nonatomic,strong)UIColor *HeadBackGroundColor;
@property(nonatomic,strong)UIColor *HeadColor;


-(id)initWithCellHeight:(CGRect)frame CellHeight:(CGFloat)height;



@end
