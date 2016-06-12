//
//  PAComposerViewController.m
//  todo
//
//  Created by Cadet on 6/12/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import "PAComposerViewController.h"
#import "PATodo.h"

@interface PAComposerViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@end

@implementation PAComposerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Create";
    [self.titleText becomeFirstResponder];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBarButtonClicked:)];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
    // Do any additional setup after loading the view from its nib.
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
- (IBAction)createButtonClick:(id)sender {
    PATodo *todo = [[PATodo alloc] initWithTitle:self.titleText.text];

    [self.delegate composer:self didCreateTodo:todo];
    
}

- (void) cancelBarButtonClicked:(id) sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
