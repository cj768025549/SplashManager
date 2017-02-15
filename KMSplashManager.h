//
//  LJSplashManager.h
//  BaseFrame
//
//  Created by changjian on 16/8/17.
//  Copyright (c) 2015年 58. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HLSplashConfigModel;
@interface KMSplashManager : NSObject

+ (KMSplashManager *)sharedSplashManager;
- (UIImage *)splashImage;

@end
