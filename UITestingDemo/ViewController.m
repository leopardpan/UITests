//
//  ViewController.m
//  UITestingDemo
//
//  Created by 潘柏信 on 15/9/28.
//  Copyright © 2015年 leopardpan. All rights reserved.
//

#import "ViewController.h"
#import "TalkingData.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *psdTextField;

@end

NSString *name = @"leopard";
NSString *psd = @"123";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginAction:(UIButton *)sender {
    [self.userNameTextField resignFirstResponder];
    [self.psdTextField resignFirstResponder];
    self.title = @"登录中...";
    sender.enabled = NO;
    self.title = @"登陆";
    sender.enabled = YES;
    if ([self.userNameTextField.text isEqualToString:name] && [self.psdTextField.text isEqualToString:psd]) {
        
        NSUserDefaults *userdf = [NSUserDefaults standardUserDefaults];
        [userdf setObject:self.userNameTextField.text forKey:@"name"];
        
        UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        UIViewController *vc = [mainSB instantiateViewControllerWithIdentifier:@""];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
        // iOS8之后 使用 UIAlertController 做弹框
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"" message:@"登陆失败" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertVC addAction:cancelAction];
        [alertVC addAction:okAction];
        
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    
}

- (IBAction)clearAction:(UIButton *)sender {
    self.userNameTextField.text = nil;
    self.psdTextField.text = nil;
    [self.userNameTextField resignFirstResponder];
    [self.psdTextField resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 开始页面跟踪，记录这个页面的停留时长
    [TalkingData trackPageBegin:@"Home_page"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // 结束页面跟踪，记录这个页面的停留时长
    [TalkingData trackPageEnd:@"Home_page"];
}

@end
