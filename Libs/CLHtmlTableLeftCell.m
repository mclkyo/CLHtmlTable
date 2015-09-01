//
//  CLHtmlTableLeftCell.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "CLHtmlTableLeftCell.h"


@implementation CLHtmlTableLeftCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        //[self.label setVerticalAlignment:VerticalAlignmentMiddle];
        
        [self.label setTextAlignment:NSTextAlignmentCenter];
        [self.contentView addSubview:self.label];
    }
    return self;
}


@end
