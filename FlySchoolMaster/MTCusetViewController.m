//
//  MTCusetViewController.m
//  FlySchoolMaster
//
//  Created by caiyc on 14-7-18.
//  Copyright (c) 2014年 MingThink. All rights reserved.
//

#import "MTCusetViewController.h"
#import "FuncPublic.h"
#import "WToast.h"
#import "MyDbHandel.h"
#import "MTMudelDaTa.h"
@interface MTCusetViewController ()
{
     UIView *backview;
}
@end

@implementation MTCusetViewController

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
   
    [self getdata];
    // Do any additional setup after loading the view from its nib.
}
-(void)getdata
{
    backview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, DEVW, DEVH-64)];
    backview.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:backview];
    [[MyDbHandel defaultDBManager]openDb:@"NewUser.sqlite"];
    NSString *sql = [NSString stringWithFormat:@"select * from %@ order by num asc",NAME];
    NSArray *arrr = [[MyDbHandel defaultDBManager]select:sql];
    NSMutableArray *mutaarr = [NSMutableArray array];
    for(MTMudelDaTa *datas in arrr)
    {
        if([datas.status isEqualToString:@"1"])
        {
            [mutaarr addObject:datas];
        }
    }
    for(int i =0;i<arrr.count;i++)
    {
        int row = i/4;
        int dow = i%4;
        MTMudelDaTa *data = [arrr objectAtIndex:i];
        UIView *vi = [[UIView alloc]init];
        
        vi.frame = CGRectMake(10+dow*75, 10+row *80, 60, 90);
        vi.tag = data.num;
       
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 10, 60, 60);
        if([data.icon hasSuffix:@".png"])
        {
            UIImage *image = [self getImageFromURL:[NSString stringWithFormat:@"%@%@",SERVER,data.icon]];
            [btn setBackgroundImage:image forState:UIControlStateNormal];
        }
        else
        {

        [btn setBackgroundImage:[UIImage imageNamed:data.icon] forState:UIControlStateNormal];
        }
        [vi addSubview:btn];
        [backview addSubview:vi];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 60, 20)];
        label.text = data.name;
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = 1;
        [vi addSubview:label];
        if([data.status isEqualToString:@"0"])
        {
            
            UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
            btn1.frame = CGRectMake(0, 0, 25, 25);
            // [btn1 setBackgroundImage:[UIImage imageNamed:@"deleteTag.png"] forState:UIControlStateNormal];
            //  btn1.hidden = YES;
            [btn1 addTarget:self action:@selector(addbtn:) forControlEvents:UIControlEventTouchUpInside];
            btn1.tag  = data.num+1001;
            // [btn1 addTarget:self action:@selector(deleteaction:) forControlEvents:UIControlEventTouchUpInside];
            //   [delebutarr addObject:btn1];
            [vi addSubview:btn1];
        }
    }
}
//网络图片下载
-(UIImage *) getImageFromURL:(NSString *)fileURL {
    NSLog(@"执行图片下载函数");
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}
-(void)addbtn:(UIButton *)btn
{
    btn.hidden = YES;
    [[MyDbHandel defaultDBManager]openDb:DBName];
    NSString *sql = [NSString stringWithFormat:@"update %@ set status = '1' where mouname = '主页' and num = %d",NAME,btn.tag-1001];
    [[MyDbHandel defaultDBManager]updata:sql];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"statuschange" object:nil userInfo:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)backto:(id)sender {
//    [UIView animateKeyframesWithDuration:.3 delay:.2 options:3 animations:^{
//        self.view.transform = CGAffineTransformMakeScale(0.0000001, 0.00001);
//        self.view.clipsToBounds = YES;
//    } completion:^(BOOL finished) {
//        [self.navigationController popViewControllerAnimated:NO];
//    }];
//}


- (IBAction)backto:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
//        [UIView animateKeyframesWithDuration:.3 delay:.2 options:3 animations:^{
//            self.view.transform = CGAffineTransformMakeScale(0.0000001, 0.00001);
//            self.view.clipsToBounds = YES;
//        } completion:^(BOOL finished) {
//          [self.navigationController popViewControllerAnimated:NO];
//       }];
}
@end
