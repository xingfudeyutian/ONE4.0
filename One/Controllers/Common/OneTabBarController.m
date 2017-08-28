//
//  OneTabBarController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneTabBarController.h"
#import "OneHomeViewController.h"
#import "OneAllViewController.h"
#import "OneMeViewController.h"


@interface OneTabBarController ()
@property (nonatomic, strong) NSArray * titles;
@end

@implementation OneTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBarItem setImageInsets:UIEdgeInsetsMake(10, 0, -10, 0)];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"me_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationItemAction:)];
    
//    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"search_gray"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationItemAction:)];
    
//    self.title = self.titles[0];
    [self createViewControllers];
    [self createMyTabBarItem];
}

-(void)navigationItemAction:(UIBarButtonItem *)itm
{
    
}

- (void)createViewControllers
{
    OneHomeViewController * homeVC = [[OneHomeViewController alloc] init];
    UINavigationController * homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    OneAllViewController * allVC = [[OneAllViewController alloc] init];
    UINavigationController * allNav = [[UINavigationController alloc] initWithRootViewController:allVC];

    OneMeViewController * meVC = [[OneMeViewController alloc] init];
    UINavigationController * meNav = [[UINavigationController alloc] initWithRootViewController:meVC];

    [self setViewControllers:@[homeNav,allNav,meNav]];
    
}



- (void)createMyTabBarItem
{
    
    UITabBarItem * homeItem = self.tabBar.items[0];
    [self tabbarItem:homeItem imageName:@"homeUnselectedV4" selectImageName:@"homeSelectedV4"];
    UITabBarItem * allItem = self.tabBar.items[1];
    [self tabbarItem:allItem imageName:@"allUnselectedV4" selectImageName:@"allSelectedV4"];
    
    UITabBarItem * meItem = self.tabBar.items[2];
    [self tabbarItem:meItem imageName:@"meUnselectedV4" selectImageName:@"meSelectedV4"];

}


-(void)tabbarItem:(UITabBarItem*)item imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{
     [item setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.image = image;
    UIImage *selectImage = [UIImage imageNamed:selectImageName];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item.selectedImage = selectImage;
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
//    self.title = self.titles[index];
}


#pragma mark - 懒加载
- (NSArray *)titles
{
    if (_titles == nil)
    {
        _titles = [NSArray arrayWithObjects:@"一个",@"一个阅读",@"一个音乐",@"一个影视", nil];
    }
    return _titles;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
