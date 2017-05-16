//
//  ViewController.m
//  BILocationView
//
//  Created by 皇家少爷齐熠 on 2017/5/9.
//  Copyright © 2017年 NetWork. All rights reserved.
//

#import "ViewController.h"
#import "BILocationViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 100, 30);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}


-(void)btnClick:(UIButton *)sender
{
    
    
    BILocationViewController *Location = [[BILocationViewController alloc]init];
    

    
    [self.navigationController pushViewController:Location animated:YES];

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
