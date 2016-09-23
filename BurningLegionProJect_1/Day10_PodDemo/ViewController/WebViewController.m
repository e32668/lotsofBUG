//
//  WebViewController.m
//  Day10_PodDemo
//
//  Created by tarena03 on 16/9/21.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@end

@implementation WebViewController
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.view showHUD];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self.view showMsg:error.description];
}

- (instancetype)initWithURL:(NSURL *)webURL
{
    if (self = [super init]) {
        self.webURL = webURL;
    }
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _webView = [[UIWebView alloc]init];
    _webView.delegate =self;
    [self.view addSubview:_webView];
    [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [_webView loadRequest:[NSURLRequest requestWithURL:self.webURL]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
