//
//  SQWebViewDelegate.m
//  JSContextBridge
//
//  Created by 沈强 on 15/7/12.
//  Copyright (c) 2015年 沈强. All rights reserved.
//

#import "SQWebViewDelegate.h"
#import "UIWebView+JSContext.h"

@interface SQWebViewDelegate ()
@property(nonatomic,strong) NSMutableDictionary *interfaces;
@end

@implementation SQWebViewDelegate

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name forWebView:(UIWebView *)webView{
    if (!_interfaces) {
        _interfaces = [NSMutableDictionary dictionary];
    }
    [_interfaces setObject:interface forKey:name];
    JSContext * jsContext = [webView jsContext];
    [jsContext setObject:interface forKeyedSubscript:name];
    
}

- (void)injectInterfaces:(UIWebView *)webView{
    JSContext * jsContext = [webView jsContext];
    for (NSString *key in _interfaces.allKeys) {
        NSObject *interface  = [_interfaces objectForKey:key];
        [jsContext setObject:interface forKeyedSubscript:key];
    }
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    if ([_realDelegate respondsToSelector:@selector(webView:shouldStartLoadWithRequest:navigationType:)]) {
        return  [_realDelegate webView:webView shouldStartLoadWithRequest:request navigationType:navigationType];
    }else{
        return YES;
    }
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    if ([_realDelegate respondsToSelector:@selector(webViewDidStartLoad:)]) {
        [_realDelegate webViewDidStartLoad:webView];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self injectInterfaces:webView];
    if ([_realDelegate respondsToSelector:@selector(webViewDidFinishLoad:)]) {
        [_realDelegate webViewDidFinishLoad:webView];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if ([_realDelegate respondsToSelector:@selector(webView:didFailLoadWithError:)]) {
        [_realDelegate webView:webView didFailLoadWithError:error];
    }
}

@end
