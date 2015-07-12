//
//  UIWebView+JSContext.m
//  
//
//  Created by 沈强 on 15/7/12.
//
//

#import "UIWebView+JSContext.h"

@implementation UIWebView (JSContext)

- (JSContext *)jsContext{
    JSContext *jsContext = [self valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    return jsContext;
}

@end
