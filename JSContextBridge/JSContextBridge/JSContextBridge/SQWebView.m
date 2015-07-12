//
//  SQWebView.m
//  JSContextBridge
//
//  Created by 沈强 on 15/7/12.
//  Copyright (c) 2015年 沈强. All rights reserved.
//

#import "SQWebView.h"
#import "SQWebViewDelegate.h"

@interface SQWebView()
@property(nonatomic,strong)SQWebViewDelegate *sqDelegate;
@end

@implementation SQWebView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _sqDelegate = [SQWebViewDelegate new];
       super.delegate = _sqDelegate;
    }
    return self;
}

- (instancetype)init{
    if (self = [super init]) {
        _sqDelegate = [SQWebViewDelegate new];
        self.delegate = _sqDelegate;
    }
    return self;
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate{
    if (delegate != _sqDelegate) {
       _sqDelegate.realDelegate = delegate;
    }
}

- (void)addJavaScripInterfaces:(id)interface withJSObejectNameOrFunctionName:(NSString *)name{
    [_sqDelegate addJavaScripInterfaces:interface withJSObejectNameOrFunctionName:name forWebView:self];
}

@end
