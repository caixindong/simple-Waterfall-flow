//
//  DetailViewController.m
//  userAFNetworking
//
//  Created by 蔡欣东 on 16/4/14.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"detail";
    // Do any additional setup after loading the view.
    [_myWebView loadHTMLString:_model.Description baseURL:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
