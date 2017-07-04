# XLQRCodeScan
* 引用SGQRCode，感谢博主
## 主要内容的介绍

* `普通二维码生成`<br>

* `彩色二维码生成`<br>

* `带有小图标二维码生成`<br>

* `扫描二维码的自定义`<br>

* `是否开启闪光灯`<br>

* `从相册中获取二维码`<br>

* `扫描成功之后提示音`<br>

* `扫描成功之后的界面之间的跳转`<br>

* `扫描二维码界面采取了微信二维码界面的布局`<br>


## 代码介绍 (详细使用方法，请参考 Demo)

#### 1、添加 info.plist 字段 

* 需要添加的字段

* `NSCameraUsageDescription (相机权限访问)`<br>

* `NSPhotoLibraryUsageDescription (相册权限访问)`<br>

#### 2、导入 SGQRCode 文件夹

#### 3、生成二维码

* 普通二维码生成
```Objective-C
imageView.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"https://github.com/kingsic" imageViewWidth:imageViewW];
```

* logo 二维码生成
```Objective-C
imageView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"https://github.com/kingsic" logoImageName:@"icon_image" logoScaleToSuperView:scale];
```

* 彩色二维码生成
```Objective-C
imageView.image = [SGQRCodeTool SG_generateWithColorQRCodeData:@"https://github.com/kingsic" backgroundColor:[CIColor colorWithRed:1 green:0 blue:0.8] mainColor:[CIColor colorWithRed:0.3 green:0.2 blue:0.4]];
```

#### 3、扫描二维码

* 新建一个扫描控制器继承 SGQRCodeScanningVC ，并在 .h 中导入 “SGQRCode.h”

* SGQRCodeScanningVC.m
```Objective-C
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册观察者
    
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeAibum:) name:SGQRCodeInformationFromeAibum object:nil];
    
    [SGQRCodeNotificationCenter addObserver:self selector:@selector(SGQRCodeInformationFromeScanning:) name:SGQRCodeInformationFromeScanning object:nil];
}
```

```Objective-C
- (void)SGQRCodeInformationFromeAibum:(NSNotification *)noti {

    NSString *string = noti.object;
    
    // 在此处理数据（将拿到的 string 传递给下一个界面）
}
```
