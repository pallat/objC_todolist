//
//  PAComposerViewController.h
//  todo
//
//  Created by Cadet on 6/12/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PAComposerViewController, PATodo;

@protocol PAComposerDelegate <NSObject>

- (void) composer: (PAComposerViewController *) composerVC didCreateTodo: (PATodo *) todo;

@end

@interface PAComposerViewController : UIViewController
    @property (nonatomic, weak) id<PAComposerDelegate> delegate;
@end
