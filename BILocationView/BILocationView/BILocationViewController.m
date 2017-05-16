//
//  BILocationViewController.m
//  BILocationView
//
//  Created by 皇家少爷齐熠 on 2017/5/9.
//  Copyright © 2017年 NetWork. All rights reserved.
//

#import "BILocationViewController.h"
#import "NSDate+Helper.h"
#import "Html5ViewController.h"

@interface BILocationViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSArray *arrayC;
    NSString *selectName;
}

@end

@implementation BILocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
    
    self.title = @"报表";
    NSDictionary *dic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f], [UIFont systemFontOfSize:16 weight:16], nil] forKeys:[NSArray arrayWithObjects:NSForegroundColorAttributeName, NSFontAttributeName, nil]];
    
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    //
    [self LocationView];
}

-(void)LocationView
{

    UIView *LocationView = [[UIView alloc]initWithFrame:CGRectMake(0, 70, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    
    LocationView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:LocationView];
    
    //货量统计、承运统计按钮
    NSArray *array = @[@"货量统计",@"承运统计"];
    
    for (int i = 0; i < array.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame = CGRectMake(40 + ([UIScreen mainScreen].bounds.size.width )/2 * i, 25 , [UIScreen mainScreen].bounds.size.width / 3.4, [UIScreen mainScreen].bounds.size.width / 3 / 3.4);
        
        [button setTitle:[NSString stringWithFormat:@"%@",array[i]] forState:UIControlStateNormal];
        
        
        
        button.layer.masksToBounds = YES;
        button.layer.borderWidth = 1.0f;
        
        [button setTitleColor:[UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f] forState:UIControlStateNormal];
        button.layer.borderColor = [UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f].CGColor;
        
        
        button.tag = 100 + i;
        
        if (i == 1) {
            
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
        }
        
        [button addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
        
        [LocationView addSubview:button];
    }
    
    
    
    NSArray *title = @[@"类型",@"货品",@"周期"];
    NSArray *test = @[@"普通/代理",@"煤炭",@"3月1日",@"3月10日"];
    for (int i = 0; i < title.count; i++) {
        
        if (i == 2) {
            
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width / 3 / 3.4 + 25 + 25 + 61 * i, [UIScreen mainScreen].bounds.size.width, 60)];
            
         //   lineView.backgroundColor = [UIColor cyanColor];
            [LocationView addSubview:lineView];
            //
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 15,40, 30)];
            label.text = [NSString stringWithFormat:@"%@",title[i]];
            label.font = [UIFont systemFontOfSize:14.0f];
            label.textColor = [UIColor grayColor];
            //   label.backgroundColor = [UIColor redColor];
            label.textAlignment = NSTextAlignmentCenter;
            [lineView addSubview:label];

            //
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width + 5, label.frame.origin.y + label.frame.size.height + 8, ([UIScreen mainScreen].bounds.size.width - (label.frame.origin.x + 5)) * 0.35, 1.8)];
            line.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
            [lineView addSubview:line];
            //
            UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            selectBtn.frame = CGRectMake(line.frame.origin.x, 10, line.frame.size.width - 4, line.frame.origin.y - 12);
            [selectBtn setTitle:[NSString stringWithFormat:@"%@",test[i]] forState:UIControlStateNormal];
     //          selectBtn.backgroundColor = [UIColor purpleColor];
            
            [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            selectBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            selectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
            selectBtn.tag = 1000 + i;
            [lineView addSubview:selectBtn];

            //
//
            //
            UILabel *line2 = [[UILabel alloc]initWithFrame:CGRectMake(line.frame.origin.x + line.frame.size.width + 40, label.frame.origin.y + label.frame.size.height + 8, ([UIScreen mainScreen].bounds.size.width - (label.frame.origin.x + 5)) * 0.35, 1.8)];
            line2.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
            [lineView addSubview:line2];
            //
            UIButton *selectBtn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            selectBtn2.frame = CGRectMake(line2.frame.origin.x, 10, line2.frame.size.width - 4, line2.frame.origin.y - 12);
            [selectBtn2 setTitle:[NSString stringWithFormat:@"%@",test[i+1]] forState:UIControlStateNormal];
       //     selectBtn2.backgroundColor = [UIColor purpleColor];
            
            [selectBtn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            selectBtn2.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            selectBtn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [selectBtn2 addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
            selectBtn2.tag = 1000 + i + 1;
            [lineView addSubview:selectBtn2];
            
            //

            
        }else{
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width / 3 / 3.4 + 25 + 25 + 61 * i, [UIScreen mainScreen].bounds.size.width, 60)];
        
     //   lineView.backgroundColor = [UIColor cyanColor];
        [LocationView addSubview:lineView];
        //
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 15,40, 30)];
        
        label.text = [NSString stringWithFormat:@"%@",title[i]];
        label.font = [UIFont systemFontOfSize:14.0f];
        label.textColor = [UIColor grayColor];
     //   label.backgroundColor = [UIColor redColor];
        label.textAlignment = NSTextAlignmentCenter;
        [lineView addSubview:label];
        
        //
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(label.frame.origin.x + label.frame.size.width + 5, label.frame.origin.y + label.frame.size.height + 8, [UIScreen mainScreen].bounds.size.width - (label.frame.origin.x + 5), 1.8)];
        line.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
        [lineView addSubview:line];
        
        //
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        selectBtn.frame = CGRectMake(line.frame.origin.x, 10, lineView.frame.size.width - 4, line.frame.origin.y - 12);
        [selectBtn setTitle:[NSString stringWithFormat:@"%@",test[i]] forState:UIControlStateNormal];
     //   selectBtn.backgroundColor = [UIColor purpleColor];
        
        [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selectBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        selectBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
            selectBtn.tag = 1000 + i;
        [lineView addSubview:selectBtn];
        
        
        }
        
    }
    
    
    //立即搜索
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    searchBtn.frame = CGRectMake(30, LocationView.frame.size.height - 30 - 45, [UIScreen mainScreen].bounds.size.width - 60, 45);
    searchBtn.layer.masksToBounds = YES;
    searchBtn.layer.cornerRadius = 6.0f;
    [searchBtn setTitle:@"立即搜索" forState:UIControlStateNormal];
    searchBtn.backgroundColor = [UIColor colorWithRed:111/255.0 green:163/255.0 blue:233/255.0 alpha:1.0f];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchClick:) forControlEvents:UIControlEventTouchUpInside];
    [LocationView addSubview:searchBtn];
    

}

-(void)button:(UIButton *)sender
{
    UIButton *btn = (UIButton *)[self.view viewWithTag:100];
    UIButton *btn2 = (UIButton *)[self.view viewWithTag:101];
    
    if (sender.tag == 100) {
       
        [btn setTitleColor:[UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f] forState:UIControlStateNormal];
        btn.layer.borderColor = [UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f].CGColor;
        btn.backgroundColor = [UIColor whiteColor];
        //
        btn2.layer.borderColor = [UIColor whiteColor].CGColor;
        [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn2.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
        
        
        
    }else{
    
        [btn2 setTitleColor:[UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f] forState:UIControlStateNormal];
        btn2.layer.borderColor = [UIColor colorWithRed:101/255.0 green:168/255.0 blue:234/255.0 alpha:1.0f].CGColor;
        btn2.backgroundColor = [UIColor whiteColor];
        //
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0f];
        
    }
    
    NSLog(@"---%ld---",(long)sender.tag);
    
}

-(void)selectClick:(UIButton *)sender
{
    NSLog(@"%ld",(long)sender.tag);
    
    if (sender.tag == 1000) {
        
        arrayC = @[@"请选择",@"普通",@"代理"];
        [self ChangeClick];
    }
    
    if (sender.tag == 1001) {
        
        arrayC = @[@"请选择",@"煤炭",@"石油",@"原油",@"原煤",@"块煤"];
        [self ChangeClick];
    }
    
    if (sender.tag == 1002 || sender.tag == 1003) {
      [self dateClick];
    }
    
}

-(void)searchClick:(UIButton *)sender
{
    NSLog(@"立即搜索");
    
    Html5ViewController *html = [[Html5ViewController alloc]init];
    
    [self.navigationController pushViewController:html animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dateClick{
    
    UIDatePicker *picker = [[UIDatePicker alloc]init];
    picker.datePickerMode = UIDatePickerModeDate;
    
    picker.frame = CGRectMake(0, 40, 320, 200);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSDate *date = picker.date;
        NSLog(@"%@",[date stringWithFormat:@"yyyy-MM-dd"]);
        NSLog(@"%@",[date stringWithFormat:@"MM-dd"]);
        
     
        
    }];
    [alertController.view addSubview:picker];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

//
- (void)ChangeClick{
    
    UIPickerView *picker = [[UIPickerView alloc]init];
    picker.delegate = self;
    picker.dataSource = self;
    
    picker.frame = CGRectMake(0, 40, 320, 200);
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        NSLog(@"%@",selectName);
        
    }];
    
    [alertController.view addSubview:picker];
    [alertController addAction:cancelAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    
    return arrayC.count;
}



-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    
    NSString *name = arrayC[row];
  
    return name;
    
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

//    UIButton *btn = (UIButton *)[self.view viewWithTag:1000];
//    UIButton *btn2 = (UIButton *)[self.view viewWithTag:1001];
//

    selectName = [NSString stringWithFormat:@"%@",arrayC[row]];
    

}


@end
