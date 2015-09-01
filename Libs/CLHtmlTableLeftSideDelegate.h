//
//  CLHtmlTableLeftSideDelegate.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol CLHtmlTableLeftSideDelegate <NSObject>

@required

-(NSString*)getFirstRowName:(NSIndexPath*)path;
-(NSUInteger)getRowCount;
-(NSString*)getColumnName;


@end