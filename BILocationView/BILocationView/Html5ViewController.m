//
//  Html5ViewController.m
//  BILocationView
//
//  Created by 皇家少爷齐熠 on 2017/5/11.
//  Copyright © 2017年 NetWork. All rights reserved.
//

#import "Html5ViewController.h"
#import <WebKit/WebKit.h>

@interface Html5ViewController ()<UIWebViewDelegate>
{
    UIWebView *webView;
}

@end

@implementation Html5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"图标";
    
    //cargotype=0 1 2
    
//    WKWebView *webView = [[WKWebView alloc] init];
//    
//    webView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    
//    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://u.ikuaichuan.com:8080/olms/report/volume?s=1&cargotype=0&category=&startTime=2016-05-11&endTime=2017-05-11"]]];
//    [self.view addSubview:webView];
    
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://u.ikuaichuan.com:8080/olms/report/volume?s=1&cargotype=0&category=&startTime=2016-05-11&endTime=2017-05-11"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//// 页面开始加载时调用
//- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
//
//}
//// 当内容开始返回时调用
//- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
//
//}
//// 页面加载完成之后调用
//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
//
//}
//// 页面加载失败时调用
//- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
//
//}
//
//
//// 接收到服务器跳转请求之后再执行
//- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
//
//}
//// 在收到响应后，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
//
//}
//// 在发送请求之前，决定是否跳转
//- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
//
//}
//
@end
