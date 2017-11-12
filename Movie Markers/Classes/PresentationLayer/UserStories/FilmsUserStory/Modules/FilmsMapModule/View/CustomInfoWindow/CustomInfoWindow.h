//
//  CustomInfoWindow.h
//  Movie Points
//
//  Created by Юрий Трыков on 18.03.16.
//  Copyright © 2016 trykov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomInfoWindow : UIView
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *adress;

@end
