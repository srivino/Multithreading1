//
//  ViewController.h
//  Multithreading
//
//  Created by Rajarajeswaran Shanmugam on 3/3/16.
//  Copyright © 2016 janbaskclass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imgview;
- (IBAction)PerformSelector:(id)sender;

- (IBAction)GCD:(id)sender;
-(void)multithreadingusingGCD;
@end

