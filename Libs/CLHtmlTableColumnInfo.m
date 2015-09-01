//
//  CLHtmlTableColumnData.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableColumnInfo.h"

@interface CLHtmlTableColumnInfo(){
}
@end

@implementation CLHtmlTableColumnInfo

-(id)initWithName:(NSString *)name Width:(int)width{
    self = [super init];
    if(self){
        self.ColumnName = name;
        self.Width = width;
        self.IsCustomerView = NO;
    }
    return self;
}

-(id)initWithName:(NSString *)name Width:(int)width GetCustomerViewBlock:(GetCustomerView)getCustomerViewBlock{
    self = [self initWithName:name Width:width];
    self.block = getCustomerViewBlock;
    self.IsCustomerView = YES;
    return self;
}




@end
