//
//  LJSplashManager.m
//  BaseFrame
//
//  Created by changjian on 16/8/17.
//  Copyright (c) 2015年 58. All rights reserved.
//

#import "KMSplashManager.h"
#import "SDWebImageManager.h"
#import "UIImageAdditions.h"

@interface KMSplashManager()

@property (nonatomic, strong) NSString *splashDirctory;

@end

@implementation KMSplashManager

+ (KMSplashManager *)sharedSplashManager
{
    static KMSplashManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[KMSplashManager alloc] init];
    });
    return _instance;
    
}
- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIImage *)splashImage
{
    if (s_iPhone6Plus) {
        return [UIImage imageNamed:@"1242"];
    } else if (s_iPhone6) {
        return [UIImage imageNamed:@"750"];
    } else if (s_iPhone5) {
        return [UIImage imageNamed:@"640_1136"];
    } else {
        return [UIImage imageNamed:@"640_960"];
    }
}

- (NSString *)splashImageDirctory
{
    if (self.splashDirctory.length == 0) {
        NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        self.splashDirctory = [cachesDirectory stringByAppendingString:@"SplashImage"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:self.splashDirctory]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:self.splashDirctory withIntermediateDirectories:true attributes:nil error:nil];
        }
    }
    
    return self.splashDirctory;
}

- (NSString *)iPhoneSplashImagePath
{
    return [[self splashImageDirctory] stringByAppendingString:@"iPhone"];
}

- (NSString *)iPadLandscapeSplashImagePath
{
    return [[self splashImageDirctory] stringByAppendingString:@"iPadLandscape"];
}

- (NSString *)iPadPortraitSplashImagePath
{
    return [[self splashImageDirctory] stringByAppendingString:@"iPhonePortrait"];
}

- (UIImage *)getIPadLandscapeImage
{
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:[self iPadLandscapeSplashImagePath]]];
}

- (UIImage *)getIPadPortraitImage
{
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:[self iPadPortraitSplashImagePath]]];
}

- (UIImage *)getIPhoneImage
{
    return [UIImage imageWithData:[NSData dataWithContentsOfFile:[self iPhoneSplashImagePath]]];
}
@end
