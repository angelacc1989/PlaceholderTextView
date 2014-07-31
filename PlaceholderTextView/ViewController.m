//
//  ViewController.m
//  PlaceholderTextView
//
//  Created by Sukie Zhao on 14-7-25.
//  Copyright (c) 2014年 company. All rights reserved.
//

#import "ViewController.h"
#import "PlaceHolderTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor greenColor];
    
    PlaceHolderTextView *testViewa = [[PlaceHolderTextView alloc] initWithFrame:CGRectMake(0, 20, 200, 40)];
    testViewa.placeholder = @"aaaaaaaaaa";
    [self.view addSubview:testViewa];
    [testViewa release];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
