//
//  PADetailViewController.m
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import "PADetailViewController.h"
#import "PATodo.h"

@interface PADetailViewController ()


@end

@implementation PADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.titleLabel.text = self.todo.title;
    self.toggleSwitch.on = self.todo.isDone;
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
- (IBAction)switchValue:(id)sender {
    [self.todo toggleDone];
}

@end
