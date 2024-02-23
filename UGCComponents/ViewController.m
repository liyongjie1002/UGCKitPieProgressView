//
//  ViewController.m
//  UGCComponents
//
//  Created by 国富集团赵 on 2024/1/10.
//

#import "ViewController.h"
#import "UGCKitPieProgressView.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UGCKitPieProgressView *pieView;
@property (nonatomic, assign) double progress;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.pieView = [[UGCKitPieProgressView alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 200.0)/2.0, 100, 200, 200)];
    [self.view addSubview:self.pieView];
   
}

- (IBAction)timerTest {
    
    self.progress = 0;
    
    self.timer = [NSTimer timerWithTimeInterval:0.001 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];

    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

}

- (void)timerAction {
    
    self.progress = self.progress + 0.005;
    
    if (self.progress >= 1) {
        self.progress = 1;
        self.pieView.progress = self.progress;
        [self.timer invalidate];
        self.timer = nil;
        return;
    }
    self.pieView.progress = self.progress;
}

@end
