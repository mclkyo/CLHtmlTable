//
//  Data.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "Data.h"

@implementation Data


+(NSMutableArray*)GetDatas{
    NSMutableArray *datas = [[NSMutableArray alloc]initWithCapacity:0];
    
    for(int i=0;i<50;i++){
        Data *data = [[Data alloc]init];
        data.ScoreRemain = 1000 + i *100;
        data.ScoreDays = 1000000 + i * 1000;
        data.MemberID = 3;
        data.MemberName = @"ggg";
        data.ScorePrev = 900900 + i * 1000;
        data.ScoreType = @"H";
        data.LoginID = [NSString stringWithFormat:@"ggg%d",i];
        [datas addObject:data];
    }
    
    return datas;
}
@end
