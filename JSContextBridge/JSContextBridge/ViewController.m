
//  ViewController.m
//  testJSPatch
//
//  Created by sq on 15/6/29.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "ViewController.h"

#import "UIWebView+JSContext.h"
#import "SQWebView.h"

@protocol JSViewController<JSExport>

- (NSString *)sayHello;

@end

@interface ViewController ()<UIWebViewDelegate,JSViewController>{
  SQWebView* webView;
}

@end


@implementation ViewController

- (void)viewDidLoad {

  [super viewDidLoad];
  self.title = @"jscontextBridge";
  self.edgesForExtendedLayout = 0;
  webView = [[SQWebView alloc]initWithFrame:self.view.frame];
  webView.delegate = self;
  webView.hidden = YES;
  [self.view addSubview:webView];
  [self configJSContextForWebView:webView];
  [self loadweb];
    
}

- (void)configJSContextForWebView:(SQWebView*)_webView{
    void (^push)() = ^{
        dispatch_async( dispatch_get_main_queue(), ^{
            [self.navigationController pushViewController:[ViewController new] animated:YES];
        });
    };
    
    void (^reload)() = ^{
        
        [_webView reload];
        
    };
  
    [_webView addJavaScripInterfaces:push withJSObejectNameOrFunctionName:@"push"];
    
    [_webView addJavaScripInterfaces:reload withJSObejectNameOrFunctionName:@"reload"];
    
    [_webView addJavaScripInterfaces:self withJSObejectNameOrFunctionName:@"viewController"];
 
}

- (void)loadweb{
    webView.hidden =NO;
 
    NSURL* htmlURL = [[NSBundle mainBundle] URLForResource: @"testWebView"
                                             withExtension: @"html"];

    [webView loadRequest:[[NSURLRequest alloc] initWithURL:htmlURL]];

}

- (NSString *)sayHello{
    return @"hello jscontextBridge";
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"test jscontextBridge___webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"test jscontextBridge___webViewDidFinishLoad");
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (UIView *)genView
{
  UIView * testView = [[ UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 320)];
  testView.backgroundColor = [UIColor redColor];
  return testView ;
}

-(void)tapButton{
  
}

@end
