//
//  FsprgOrderDocumentRepresentation.h
//  FsprgEmbeddedStore
//
//  Created by Lars Steiger on 2/12/10.
//  Copyright 2010 FastSpring. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "FsprgOrder.h"

//We're still using WebView, need to rewrite using WKWebView
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

/*!
 * WebDocumentRepresentation that calls FsprgEmbeddedStoreDelegate on receiving the order.
 */
@interface FsprgOrderDocumentRepresentation : NSObject <WebDocumentRepresentation> {
	FsprgOrder *order;
}

- (FsprgOrder *)order;
- (void)setOrder:(FsprgOrder *)anOrder;

@end

#pragma clang diagnostic pop
