//
//  SQWebView.h
//  JSContextBridge
//
//  Created by 沈强 on 15/7/12.
//  Copyright (c) 2015年 沈强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQWebView : UIWebView

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name;

@end
