//
//  MyThreadAppDelegate.h
//  MyThread
//
//  Created by koga kazuo on 11/08/20.
//  Copyright 2011年 Kazuo Koga. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyThreadViewController;

@interface MyThreadAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet MyThreadViewController *viewController;

@end
