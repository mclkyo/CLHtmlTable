//
//  CLHtmlTableView.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLHtmlTableDelegate.h"

@interface CLHtmlTableView : UIView

@property(nonatomic,strong)NSMutableArray *ColumnInfo;
@property(nonatomic,assign)CGFloat CellHeight;
@property(nonatomic,assign)id<CLHtmlTableDelegate> delegate;


@property(nonatomic,strong)UIColor *HeadBackGroundColor;
@property(nonatomic,strong)UIColor *HeadColor;


-(void)Build;
-(void)ReBuild;

-(void)ReloadData;

@end
