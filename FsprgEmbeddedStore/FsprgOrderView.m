//
//  FsprgOrderView.m
//  FsprgEmbeddedStore
//
//  Created by Lars Steiger on 2/18/10.
//  Copyright 2010 FastSpring. All rights reserved.
//

#import "FsprgOrderView.h"
#import "FsprgOrderDocumentRepresentation.h"
#import "FsprgEmbeddedStoreController.h"

//We're still using WebView, need to rewrite using WKWebView
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@implementation FsprgOrderView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setDataSource:nil];
        [self setNeedsLayout:FALSE];
		[self setAutoresizesSubviews:TRUE];
		[self setAutoresizingMask:(NSViewWidthSizable | NSViewHeightSizable)];
    }
    return self;
}

- (WebDataSource *)dataSource
{
    return [[dataSource retain] autorelease]; 
}
- (void)setDataSource:(WebDataSource *)aDataSource
{
    if (dataSource != aDataSource) {
        [dataSource release];
        dataSource = [aDataSource retain];
    }
}
- (void)dataSourceUpdated:(WebDataSource *)aDataSource
{
	[self setDataSource:aDataSource];
}

- (BOOL)needsLayout
{
    return needsLayout;
}

- (void)setNeedsLayout:(BOOL)flag
{
    needsLayout = flag;
}

- (void)drawRect:(NSRect)aRect
{
	if([self needsLayout]) {
		[self setNeedsLayout:FALSE];
		[self layout];
	}
	[super drawRect:aRect];
}

- (void)layout
{
	if([[self subviews] count] == 0) {
		[self setFrame:[[self superview] frame]];
		
		FsprgOrderDocumentRepresentation *representation = (FsprgOrderDocumentRepresentation *)[[self dataSource] representation];
		FsprgOrder *order = [representation order];

		FsprgEmbeddedStoreController *delegate = (FsprgEmbeddedStoreController*)[[[[self dataSource] webFrame] webView] UIDelegate];
		NSView *newSubview = [[delegate delegate] viewWithFrame:[self frame] forOrder:order];
		[self addSubview:newSubview];
	}

#if defined(MAC_OS_X_VERSION_10_7) && MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_X_VERSION_10_7
	[super layout];
#endif
}

- (void)viewDidMoveToHostWindow
{
}
- (void)viewWillMoveToHostWindow:(NSWindow *)hostWindow
{
}

- (void)dealloc
{
    [self setDataSource:nil];
	
    [super dealloc];
}

@end

#pragma clang diagnostic pop
