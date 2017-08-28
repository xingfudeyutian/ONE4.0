//
//  HomeViewController.m
//  One
//
//  Created by hanyutong on 2017/6/30.
//  Copyright © 2017年 hanyutong. All rights reserved.
//

#import "OneHomeViewController.h"
#import "OneHomeViewController+NetWork.h"
@interface OneHomeViewController ()

@end

@implementation OneHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestHomeDataWithId];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
