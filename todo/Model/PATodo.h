//
//  PATodo.h
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PATodo : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign, readonly, getter=isDone) BOOL done;
- (instancetype) initWithTitle: (NSString *) title;
- (void) toggleDone;

@end
