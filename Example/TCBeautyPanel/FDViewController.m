//
//  FDViewController.m
//  TCBeautyPanel
//
//  Created by fandongtongxue on 08/27/2021.
//  Copyright (c) 2021 fandongtongxue. All rights reserved.
//

#import "FDViewController.h"
#import <TCBeautyPanel/TCBeautyPanel.h>

@interface FDViewController ()<BeautyLoadPituDelegate>{
    TCBeautyPanelTheme         *_theme;       // 主题配置
    TCBeautyPanel *      _vBeauty;
    BOOL                            _vBeautyShow;
}

@end

@implementation FDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _theme = [[TCBeautyPanelTheme alloc]init];
    [self initBeautyUI];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    _vBeautyShow = !_vBeautyShow;
    _vBeauty.hidden = !_vBeautyShow;
}

#pragma mark ---- Video Beauty UI ----
-(void)initBeautyUI
{
    NSUInteger controlHeight = [ TCBeautyPanel getHeight];
    CGFloat offset = 0;
    if (@available(iOS 11, *)) {
        offset = [UIApplication sharedApplication].statusBarFrame.size.height > 20 ? 34 : 0;
    }
    _vBeauty = [[ TCBeautyPanel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - controlHeight - offset,
                                                              self.view.frame.size.width, controlHeight + offset)
                                             theme:_theme
                                         actionPerformer:[TCBeautyPanelActionProxy proxyWithSDKObject:nil]];
    _vBeauty.hidden = YES;
    _vBeauty.pituDelegate = self;
    _vBeauty.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:_vBeauty];
}

#pragma mark - BeautyLoadPituDelegate
- (void)onLoadPituStart{
    NSLog(@"%s",__func__);
}

- (void)onLoadPituFailed{
    NSLog(@"%s",__func__);
}

- (void)onLoadPituFinished{
    NSLog(@"%s",__func__);
}

- (void)onLoadPituProgress:(CGFloat)progress{
    NSLog(@"%s",__func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
