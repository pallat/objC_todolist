//
//  PATodo.m
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import "PATodo.h"

@implementation PATodo
- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}
- (void) toggleDone {
    _done = !_done;
}
@end
