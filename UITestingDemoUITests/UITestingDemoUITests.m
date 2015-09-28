//
//  UITestingDemoUITests.m
//  UITestingDemoUITests
//
//  Created by 潘柏信 on 15/9/28.
//  Copyright © 2015年 leopardpan. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UITestingDemoUITests : XCTestCase

@end

@implementation UITestingDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testHomeViewController {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *userNameElement = [self getAccount:@"userName"];
    if ([self canOperateElement:userNameElement]) {
        [userNameElement tap];
        [userNameElement typeText:@"leopard"];
    }
    
    XCUIElement *psdElement = [self getAccount:@"psd"];
    if ([self canOperateElement:psdElement]) {
        [userNameElement tap];
        [userNameElement typeText:@"123456"];
    }
    
    XCUIElement *loginBtn = app.buttons[@"Login"];
    if ([self canOperateElement:loginBtn]) {
        [loginBtn tap];
    }
    
    XCUIElement *window = [[app windows] elementAtIndex:0];
    if ([self canOperateElement:window]) {
        [window pressForDuration:3];
    }
    
    if ([[app alerts] count] > 0) {
        // 登录失败
        [app.alerts.collectionViews.buttons[@"确定"] tap];
        
        XCUIElement *clear = app.buttons[@"Clear"];
        if ([self canOperateElement:clear]) {
            [clear tap];
            
            if ([self canOperateElement:userNameElement]) {
                [userNameElement tap];
                [userNameElement typeText:@"leopard"];
            }
            if ([self canOperateElement:psdElement]) {
                [psdElement tap];
                [psdElement typeText:@"123"];
            }
            
            if ([self canOperateElement:loginBtn]) {
                [loginBtn tap];
            }
            if ([self canOperateElement:window]) {
                [window pressForDuration:3];
            }
            [app.buttons[@"Login"] tap];
            
        }
    
    } else {
        [app.buttons[@"Login"] tap];
    }
    

}

- (void)loginSuccess {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *window = [[app windows] elementAtIndex:0];
    if ([self canOperateElement:window]) {
        [window pressForDuration:1];
    }
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    [self testHomeViewController];
}

- (XCUIElement *)getAccount:(NSString *)name {

    return [self getElement:name type:XCUIElementTypeTextField];
}

- (XCUIElement *)getElement:(NSString *)name type:(XCUIElementType)type {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *query = [app descendantsMatchingType:type];
    XCUIElement *result;
    for (uint i = 0; i < query.count; i++) {
        XCUIElement *element = [query elementAtIndex:i];
        NSString *subLabel = [element label];
        if ([subLabel isEqualToString:name]) {
            result = element;
        }
    }
    return result;
}

- (BOOL)canOperateElement:(XCUIElement *)element {
    if (element != nil) {
        if (element.exists) {
            return YES;
        }
    }
    return NO;
}

@end
