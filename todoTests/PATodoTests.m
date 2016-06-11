//
//  PATodoTests.m
//  todo
//
//  Created by Cadet on 6/11/2559 BE.
//  Copyright © 2559 Cadet. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PATodo.h"

@interface PATodoTests : XCTestCase

@end

@implementation PATodoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void) testInitialize {
    PATodo *todo = [[PATodo alloc] initWithTitle:@"My Title"];
    XCTAssertNotNil(todo);
    XCTAssertEqual(todo.title, @"My Title");
    XCTAssertFalse(todo.isDone);
}

- (void) testInitialShouldBeDone{
    PATodo *todo = [[PATodo alloc] initWithTitle:@"Done"];
    XCTAssertFalse(todo.isDone);
    
    [todo toggleDone];
    XCTAssertTrue(todo.isDone);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
