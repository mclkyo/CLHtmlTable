//
//  CLHtmlTableColumnData.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef UIView* (^GetCustomerView)();

@interface CLHtmlTableColumnInfo : NSObject

@property(nonatomic,strong)NSString *ColumnName;
@property(nonatomic,assign)NSUInteger Width;
@property(nonatomic,copy)GetCustomerView block;
@property(nonatomic,assign)BOOL IsCustomerView;

-(id)initWithName:(NSString*)name Width:(int)width;
-(id)initWithName:(NSString *)name Width:(int)width GetCustomerViewBlock:(GetCustomerView)getCustomerViewBlock;

@end
