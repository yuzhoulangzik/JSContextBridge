//
//  SQWebViewDelegate.h
//  JSContextBridge
//
//  Created by 沈强 on 15/7/12.
//  Copyright (c) 2015年 沈强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SQWebViewDelegate : NSObject<UIWebViewDelegate>

@property(nonatomic,weak)id<UIWebViewDelegate> realDelegate;

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name forWebView:(UIWebView *)WebView;

@end
