//
//  BasicViewController.m
//  SettingsViewTest
//
//  Created by Kevin Bradley on 3/10/16.
//  Copyright © 2016 nito. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect labelFrame = CGRectMake((self.view.bounds.size.width - 300)/2, (self.view.bounds.size.height - 40)/2, 300, 40);
    UILabel *basicLabel = [[UILabel alloc] initWithFrame:labelFrame];
    basicLabel.text = @"This is a basic view controller";
    basicLabel.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:basicLabel];
    // Do any additional setup after loading the view.
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
