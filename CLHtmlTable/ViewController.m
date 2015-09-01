//
//  ViewController.m
//  CLHtmlTable
//
//  Created by yilecity on 15/8/14.
//  Copyright (c) 2015年 yilecity. All rights reserved.
//

#import "ViewController.h"
#import "Data.h"
#import "CLHtmlTableColumnInfo.h"

@interface ViewController ()<CLHtmlTableDelegate>{
    NSMutableArray *datas;
    CLHtmlTableView *tableView;
    Data *SelectData;
}

@end

@implementation ViewController


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [tableView ReBuild];
}


-(void)GoPay:(id)sender{
    UIButton *button = (UIButton*)sender;
    SelectData = [datas objectAtIndex:button.tag];
    
    NSLog(@"%@",SelectData.LoginID);
    [self performSegueWithIdentifier:@"Add" sender:self];
}


- (void)viewDidLoad {
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    datas = [Data GetDatas];
    
    NSMutableArray *columns = [[NSMutableArray alloc]init];
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"会员" Width:100]];
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"币种" Width:50]];
    
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"支付" Width:80 GetCustomerViewBlock:^UIView *{
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"支付" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(GoPay:) forControlEvents:UIControlEventTouchUpInside];
        return button;
    }]];
    
        
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"前数" Width:150]];
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"总数" Width:150]];
    [columns addObject:[[CLHtmlTableColumnInfo alloc]initWithName:@"结余" Width:150]];
    
    NSLog(@"Container:%@",NSStringFromCGRect(self.view.frame));
    
    tableView = [[CLHtmlTableView alloc]initWithFrame:self.view.frame];
    tableView.delegate = self;
    tableView.CellHeight = 40.0f;
    tableView.ColumnInfo = columns;
    [tableView Build];
    
    [self.view addSubview:tableView];
    
    
    
    
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100,100)];
//    [view setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:view];
//    
//    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(100,0,100,100)];
//    [view1 setBackgroundColor:[UIColor yellowColor]];
//    [self.view addSubview:view1];
    
    
}


-(NSString*)getFirstRowName:(NSIndexPath *)path{
    Data *data = [datas objectAtIndex:path.row];
    return data.LoginID;
}

-(NSUInteger)getCount{
    return datas.count;
}

-(NSString*)getCellContent:(NSIndexPath *)path ColumnIndex:(NSUInteger)columnIndex{
    Data *data = [datas objectAtIndex:path.row];
    if(columnIndex == 0){
        return data.LoginID;
    }
    if(columnIndex == 1){
        return data.ScoreType;
    }
    if(columnIndex == 2){
        return @"";
    }
    if(columnIndex == 3){
        return [NSString stringWithFormat:@"%d",data.ScorePrev];
    }
    
    if(columnIndex == 4){
        return [NSString stringWithFormat:@"%d",data.ScoreDays];
    }
    
    if(columnIndex == 5){
        return [NSString stringWithFormat:@"%d",data.ScoreRemain];
    }
    
    return @"";
}

-(void)DidSelect:(NSIndexPath *)indexPath{
    SelectData = [datas objectAtIndex:indexPath.row];
    NSLog(@"%@",SelectData.LoginID);
    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
