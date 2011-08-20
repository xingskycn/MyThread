//
//  MyThreadViewController.m
//  MyThread
//
//  Created by koga kazuo on 11/08/20.
//  Copyright 2011 Kazuo Koga. All rights reserved.
//

#import "MyThreadViewController.h"
#import "KAThread.h"


@interface MyThreadViewController ()

@property(nonatomic, retain) KAThread *thread;

@end


@implementation MyThreadViewController
@synthesize thread = thread_;

- (void)hello:(id)_ {
    NSLog(@"1 hello %@ %@", _, [NSRunLoop currentRunLoop]);
}

- (void)delayStop {
    [self.thread performSelector:@selector(stopRunLoop) onThread:self.thread withObject:nil waitUntilDone:YES];
    //[self.thread performSelector:@selector(requestStopRunLoop) withObject:nil];
}

- (void)delayHello {
    NSLog(@"%s", __func__);
    [self performSelector:@selector(hello:) onThread:self.thread withObject:@"End Test" waitUntilDone:NO];
    NSLog(@"%s end", __func__);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    self.thread = [[[KAThread alloc] init] autorelease];
    [self.thread start];

    [self performSelector:@selector(hello:) onThread:self.thread withObject:@"Async Test" waitUntilDone:NO];
    [self performSelector:@selector(hello:) onThread:self.thread withObject:^{ NSLog(@"Sync Test"); } waitUntilDone:YES];

    [self performSelector:@selector(delayStop) withObject:nil afterDelay:3.0f];
    [self performSelector:@selector(delayHello) withObject:nil afterDelay:5.0f];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
