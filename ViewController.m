//
//  ViewController.m
//  Multithreading
//
//  Created by Rajarajeswaran Shanmugam on 3/3/16.
//  Copyright © 2016 janbaskclass. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)PerformSelector:(id)sender {
    
    [self performSelectorInBackground:@selector(showimgusingperformselector:) withObject:@"SRI"];
    
}

- (IBAction)GCD:(id)sender {
    
    [self multithreadingusingGCD];
}

-(void)multithreadingusingGCD {
    
    __weak ViewController *weakself = self;
    
    dispatch_queue_t userDefinedqueue = dispatch_queue_create("MY CUSTOM QUEUE", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.hdwallpapersnew.net/wp-content/uploads/2015/04/amazing-lake-scenery-widescreen-full-hd-wallpaper-free-background-pictures-download.jpg"]]];
        
        NSLog(@"THE BLOCK IS GETTING EXECUTED");
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [weakself.imgview setImage:image];
        });
        
        dispatch_async(userDefinedqueue, ^{
            
            NSLog(@"USER DEFINED QUEUE");
        });
    });
   
}

-(void)showimgusingperformselector:(NSString *)string
{
    
    NSLog(@"sample method for demonstration: %@",string);
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn.pcwallart.com/images/landscape-photography-trees-wallpaper-1.jpg"]]];
    
    [self performSelectorOnMainThread:@selector(setimageonmainpic:) withObject:image waitUntilDone:NO];
    
    
}

-(void)setimageonmainpic:(UIImage *)image
{
    [self.imgview setImage:image];
}
@end
