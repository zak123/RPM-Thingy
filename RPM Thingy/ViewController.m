//
//  ViewController.m
//  RPM Thingy
//
//  Created by Zachary Mallicoat on 3/19/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
       CGPoint startLocation;
    float degrees;

}


@end

@implementation ViewController

- (void)viewDidLoad {
    
    
    //    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    
    degrees = 150;
    self.needleImage.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
    [self.view addGestureRecognizer:panGesture];
    
    [super viewDidLoad];
    
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

    // Do any additional setup after loading the view, typically from a nib.
}

- (NSTimer *) timer {
    if (!_timer) {
        _timer = [NSTimer timerWithTimeInterval:.01 target:self selector:@selector(deincrementNeedle) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didPan:(UIPanGestureRecognizer *)sender {
    CGFloat distance = 0.0;
    
    
    
    if (startLocation.x != 0.0){
        CGPoint currentLocation = [sender locationInView:self.view];
        CGFloat dx = currentLocation.x - startLocation.x;
        CGFloat dy = currentLocation.y - startLocation.y;
        distance = sqrt(dx*dx + dy*dy );
        NSLog(@"Distance: %f", distance);
        degrees = distance + 150;
        self.needleImage.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        
        
    }
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        startLocation = [sender locationInView:self.view];
    }
}

-(void)deincrementNeedle {
    
    
    
    if (degrees >=150) {
        degrees = degrees - 1;
       self.needleImage.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
        NSLog(@"%f",degrees);
        
        int MPHResult = (int)ceilf(degrees );
        
        _MPH.text = [NSString stringWithFormat: @"%d", MPHResult - 150];
    }

//    for (int i = degrees; i >= 150; i--) {
//        self.needleImage.transform = CGAffineTransformMakeRotation(i * M_PI/180);
//        NSLog(@"%d", i);
//    }
    

}

@end
