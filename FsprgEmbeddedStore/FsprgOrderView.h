//
//  FsprgOrderView.h
//  FsprgEmbeddedStore
//
//  Created by Lars Steiger on 2/18/10.
//  Copyright 2010 FastSpring. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

//We're still using WebView, need to rewrite using WKWebView
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/*!
 * WebDocumentView implementation encapsulating the order
 * confirmation view of FsprgEmbeddedStoreDelegate.
 */
@interface FsprgOrderView : NSView <WebDocumentView> {
	WebDataSource *dataSource;
	BOOL needsLayout;
}

- (WebDataSource *)dataSource;
- (void)setDataSource:(WebDataSource *)aDataSource;
- (BOOL)needsLayout;
- (void)setNeedsLayout:(BOOL)flag;

@end

#pragma clang diagnostic pop
