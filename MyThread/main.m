//
//  main.m
//  MyThread
//
//  Created by koga kazuo on 11/08/20.
//  Copyright 2011年 Kazuo Koga. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, nil);
    [pool release];
    return retVal;
}
