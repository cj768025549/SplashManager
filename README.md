# SplashManager
闪屏页面管理图片类
在AppDelegate中添加如下代码

    UIImageView *startImageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    UIImage *startImage = [[KMSplashManager sharedSplashManager] splashImage];
    startImageView.image = startImage;
    [self.window addSubview:startImageView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5f animations:^{
            startImageView.alpha = 0;
        } completion:^(BOOL finished) {
            [startImageView removeFromSuperview];
        }];
    });
