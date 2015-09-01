//
//  CLHtmlTableHead.h
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLHtmlTableHeadDelegate.h"

@interface CLHtmlTableHead : UIView

@property(nonatomic,assign)CGFloat TableWidth;
@property(nonatomic,assign)id<CLHtmlTableHeadDelegate> delegate;
@property(nonatomic,strong)UIColor *HeadColor;

-(id)initWithFrameAndDelegate:(CGRect)frame Delegate:(id<CLHtmlTableHeadDelegate>)delegate;


-(void)build;

@end
