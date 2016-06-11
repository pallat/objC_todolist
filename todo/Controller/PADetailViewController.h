//
//  PADetailViewController.h
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PATodo;

@interface PADetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
@property (weak, nonatomic) PATodo *todo;

@end
