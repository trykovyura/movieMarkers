//
// Created by Юрий Трыков on 06.11.17.
// Copyright (c) 2017 trykov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ApplicationConfigurator <NSObject>
- (void)configureInitialSettings;
@end