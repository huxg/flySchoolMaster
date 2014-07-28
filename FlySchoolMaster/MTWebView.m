//
//  MTWebView.m
//  FlySchoolMaster
//
//  Created by caiyc on 14-7-25.
//  Copyright (c) 2014年 MingThink. All rights reserved.
//

#import "MTWebView.h"

@interface MTWebView ()

@end

@implementation MTWebView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  //  NSString *urlstr = [_MoudelDic objectForKey:@"param"];
    self.titlelb.text = _titlestr;
    NSURL *url =[NSURL URLWithString:_urlstr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *web = [[UIWebView alloc]initWithFrame:CGRectMake(0, 60, DEVW, DEVH-60-50)];
    [web loadRequest:request];
    [self.view addSubview:web];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}
@end
