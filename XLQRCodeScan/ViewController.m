//
//  ViewController.m
//  XLQRCodeScan
//
//  Created by 晓琳 on 17/7/4.
//  Copyright © 2017年 xiaolin.han. All rights reserved.
//

#import "ViewController.h"
#import "CreateQRCodeViewController.h"
#import "ScanQRCodeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"二维码";
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *scanBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    scanBtn.frame = CGRectMake(100, 150, 175, 50);
    scanBtn.backgroundColor = [UIColor yellowColor];
    [scanBtn setTitle:@"扫描二维码" forState:UIControlStateNormal];
    [scanBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:scanBtn];
    [scanBtn addTarget:self action:@selector(scanAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *createBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    createBtn.frame = CGRectMake(100, 300, 175, 50);
    createBtn.backgroundColor = [UIColor yellowColor];
    [createBtn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [createBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.view addSubview:createBtn];
    [createBtn addTarget:self action:@selector(createAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark -- 首先判断访问权限
- (void)scanAction:(UIButton *)button {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    
                    //用户第一次同意了访问相机权限
                    dispatch_async(dispatch_get_main_queue(),^{
                        
                        ScanQRCodeViewController *vc = [[ScanQRCodeViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        
                    });
                }else {
                    //用户第一次拒绝了访问相机权限
                    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"用户第一次拒绝了访问相机权限" preferredStyle:(UIAlertControllerStyleAlert)];
                    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    
                    [alertC addAction:alertA];
                    [self presentViewController:alertC animated:YES completion:nil];
                }
                
            }];
        }else if (status == AVAuthorizationStatusAuthorized) {
        
            ScanQRCodeViewController *vc = [[ScanQRCodeViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (status == AVAuthorizationStatusDenied) {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"用户拒绝当前应用访问相机" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"因为系统原因, 无法访问相册" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        }else {
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
        }
        
    }

}

- (void)createAction:(UIButton *)button {
    
    CreateQRCodeViewController *vc = [[CreateQRCodeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
