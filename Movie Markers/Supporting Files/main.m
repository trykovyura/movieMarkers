//
//  main.m
//  Movie Markers
//
//  Created by Юрий Трыков on 30.07.17.
//  Copyright © 2017 trykov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RamblerAppDelegateProxy.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        [[RamblerAppDelegateProxy injector] setDefaultAppDelegate:[AppDelegate new]];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([RamblerAppDelegateProxy class]));
    }
}
