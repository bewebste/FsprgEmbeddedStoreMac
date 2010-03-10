//
//  OrderViewController.h
//  TestApp
//
//  Created by Lars Steiger on 2/28/10.
//  Copyright 2010 FastSpring. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OrderViewController : NSViewController {
	NSString *fileName;
}

- (NSString *)fileName;
- (void)setFileName:(NSString *)aFileName;

- (IBAction)saveAs:(id)sender;

@end
