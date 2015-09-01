//
//  CLHtmlTableDelegate.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol CLHtmlTableDelegate <NSObject>

@required

-(NSString*)getFirstRowName:(NSIndexPath*)path;
-(NSUInteger)getCount;
-(NSString*)getCellContent:(NSIndexPath*)path ColumnIndex:(NSUInteger)columnIndex;

@optional
-(void)DidSelect:(NSIndexPath*)indexPath;

@end
