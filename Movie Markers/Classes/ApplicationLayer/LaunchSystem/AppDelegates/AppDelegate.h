//
//  AppDelegate.h
//  Movie Points
//
//  Created by Юрий Трыков on 19.02.16.
//  Copyright © 2016 trykov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ApplicationConfigurator;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) id <ApplicationConfigurator> applicationConfigurator;

@end

