//
//  Data.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

@property(nonatomic,assign)int MemberID;
@property(nonatomic,strong)NSString *LoginID;
@property(nonatomic,strong)NSString *MemberName;
@property(nonatomic,strong)NSString *ScoreType;
@property(nonatomic,assign)int ScorePrev;
@property(nonatomic,assign)int ScoreDays;
@property(nonatomic,assign)int ScoreRemain;


+(NSMutableArray*)GetDatas;
@end
