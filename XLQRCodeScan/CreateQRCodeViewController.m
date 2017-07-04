//
//  CreateQRCodeViewController.m
//  XLQRCodeScan
//
//  Created by 晓琳 on 17/7/4.
//  Copyright © 2017年 xiaolin.han. All rights reserved.
//

#import "CreateQRCodeViewController.h"
#import "SGQRCodeTool.h"

@interface CreateQRCodeViewController ()

@end

@implementation CreateQRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"生成二维码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createGeneralQRCode];
    [self createIconQRCode];
    [self createColorQRCode];
    
}

#pragma mark -- 普通二维码
- (void)createGeneralQRCode {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 80;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"https://github.com/Carolineline" imageViewWidth:imageViewW];
    
//#pragma mark - - - 模仿支付宝二维码样式（添加用户头像）
//    CGFloat scale = 0.22;
//    CGFloat borderW = 2;
//    UIView *borderView = [[UIView alloc] init];
//    CGFloat borderViewW = imageViewW * scale;
//    CGFloat borderViewH = imageViewH * scale;
//    CGFloat borderViewX = 0.5 * (imageViewW - borderViewW);
//    CGFloat borderViewY = 0.5 * (imageViewH - borderViewH);
//    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
//    borderView.layer.borderWidth = borderW;
//    borderView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    borderView.layer.cornerRadius = 3;
//    borderView.layer.masksToBounds = YES;
//    borderView.layer.contents = (id)[UIImage imageNamed:@"logo"].CGImage;
//    
//    [imageView addSubview:borderView];
}

#pragma mark -- 中间带图片的二维码
- (void)createIconQRCode {
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 240;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    CGFloat scale = 0.2;
    
    // 2、将最终合得的图片显示在UIImageView上
    imageView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"https://github.com/Carolineline" logoImageName:@"logo" logoScaleToSuperView:scale];
}

#pragma mark -- 彩色二维码
- (void)createColorQRCode {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 400;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    imageView.image = [SGQRCodeTool SG_generateWithColorQRCodeData:@"https://github.com/Carolineline"  backgroundColor:[CIColor colorWithRed:0.2 green:0.3 blue:0.6] mainColor:[CIColor colorWithRed:1 green:0 blue:0]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
