//
//  UIControllerLaunch.m
//  
//
//  Created by David on 16/2/18.
//
//

#import "UIControllerLaunch.h"

@interface UIControllerLaunch ()

@end

@implementation UIControllerLaunch

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray* arrImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGSize screenSize = CGSizeMake(MIN(size.width, size.height), MAX(size.width, size.height));
    NSString *imageName;
    NSString *orientation = UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)?@"Portrait":@"Landscape";
    for (NSDictionary* dictLaunch in arrImages) {
        size = CGSizeFromString(dictLaunch[@"UILaunchImageSize"]);
        CGSize imageSize = CGSizeMake(MIN(size.width, size.height), MAX(size.width, size.height));
        NSString *orientationLaunch = dictLaunch[@"UILaunchImageOrientation"];
        if (CGSizeEqualToSize(screenSize, imageSize) && [orientation isEqualToString:orientationLaunch]) {
            imageName = dictLaunch[@"UILaunchImageName"];
#ifdef DEBUG
            NSLog(@"%@", dictLaunch);
#endif
            break;
        }
    }
    UIImage *image = [UIImage imageNamed:imageName];
    if (image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.clipsToBounds = YES;
        imageView.backgroundColor = [UIColor colorWithWhite:0.93 alpha:1];
        imageView.frame = self.view.bounds;
        imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:imageView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate {
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (instancetype)controllerLaunch {
    return [UIControllerLaunch new];
}

+ (instancetype)controllerLaunchFromSB {
    return [[UIStoryboard storyboardWithName:@"LaunchScreen" bundle:nil] instantiateViewControllerWithIdentifier:@"UIControllerLaunch"];
}

@end
