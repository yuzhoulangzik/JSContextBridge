//
//  UIWebView+JSContext.h
//  
//
//  Created by 沈强 on 15/7/12.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>

@interface UIWebView (JSContext)

- (JSContext *)jsContext;

@end
