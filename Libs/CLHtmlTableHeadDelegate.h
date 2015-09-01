//
//  CLHtmlTableHeadDelegate.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//
@class CLHtmlTableColumnInfo;

@protocol CLHtmlTableHeadDelegate <NSObject>

@required

-(CLHtmlTableColumnInfo*)getColumnName:(NSUInteger)ColumnIndex;
-(NSUInteger)getColumnCount;
-(CGFloat)getHeight;

@end