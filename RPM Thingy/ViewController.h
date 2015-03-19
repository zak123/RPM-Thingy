//
//  ViewController.h
//  RPM Thingy
//
//  Created by Zachary Mallicoat on 3/19/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) UIImageView *needleImage;
@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UILabel *MPH;

-(void) deincrementNeedle;

@end

