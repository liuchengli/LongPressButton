//
//  ViewController.m
//  LongPressButton
//
//  Created by 刘成利 on 2017/4/14.
//  Copyright © 2017年 刘成利. All rights reserved.
//

#import "ViewController.h"

#import "LongPressButton.h"


@interface ViewController ()

@property (nonatomic, strong) LongPressButton *longButton;    // 长按按钮

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 长按按钮
    self.longButton = [[LongPressButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    
    [self.view addSubview:self.longButton];
    
    __weak ViewController *weakSelf = self;
    self.longButton.eventBlock = ^(TouchType TouchType,NSTimeInterval time){
        
        switch (TouchType) {
            case LongTouchBegin:
                [weakSelf startEvent];
                break;
            case LongTouchEnd:
                [weakSelf endEvent];
                break;
                
                
            default:
                break;
        }
        
        
    };

    
    
}



- (void)startEvent{
    
    

}

- (void)endEvent{
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0/*延迟执行时间*/ * NSEC_PER_SEC));
    
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        [self.longButton finishAndRest];
        
    });

    
}




@end
