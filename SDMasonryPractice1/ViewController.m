//
//  ViewController.m
//  SDMasonryPractice1
//
//  Created by yurongde on 15/5/29.
//  Copyright (c) 2015年 yurongde. All rights reserved.
//

#import "ViewController.h"
/*水平等间距和垂直等间距*/
#import "UIView+Masonry_LJC.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor blackColor];
    //居中的神力，前三个方法调用会用到。
//    WS(weakSelf);

//    UIView *v1 = [UIView new];
//    v1.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:v1];
//    
//    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(weakSelf.view);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
    
//    [self setViewIndesetFromSuperView:v1];
//    [self setViewVerticalMiddleWithEqualPaddingFromV1:v1];
//    [self setScrollViewBySuperView:v1];
    [self setEqualPaddingHorizontalAndVertical];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Private Methods
/**
 *  设置距离父view的边缘为10pt
 *
 *  @param v1 父view
 */
- (void)setViewIndesetFromSuperView:(UIView *)v1 {
    //距离v1边缘10pt
        UIView *sv1 = [UIView new];
        [self.view addSubview:sv1];
        sv1.backgroundColor = [UIColor redColor];
        [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(v1).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        }];
}
/**
 *  两个高度为150的view垂直居中且宽相等，等间距排列
 *
 *  @param v1
 */
- (void)setViewVerticalMiddleWithEqualPaddingFromV1:(UIView *)v1 {
    //两个高度为150的view垂直居中且宽相等，等间距排列
    
        int padding = 10;
        UIView *sv2 = [UIView new];
        sv2.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:sv2];
    
        UIView *sv3 = [UIView new];
        sv3.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:sv3];
    
        [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(v1.mas_centerY);
            make.left.equalTo(v1.mas_left).with.offset(padding);
            make.right.equalTo(sv3.mas_left).with.offset(-padding);
            make.height.mas_equalTo(@150);
            make.width.equalTo(sv3);
    
        }];
    
        [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(v1.mas_centerY);
            make.left.equalTo(sv2.mas_right).with.offset(padding);
            make.right.equalTo(v1.mas_right).with.offset(-padding);
            make.height.mas_equalTo(@150);
            make.width.equalTo(sv2);
        }];

}
/**
 *  用一个VIEW装载视图，并算出contentsize，当做scrollview的contentsize
 *
 *  @param v1 父view
 */
- (void)setScrollViewBySuperView:(UIView *)v1 {
    
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.backgroundColor = [UIColor whiteColor];
        [v1 addSubview:scrollView];
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(v1).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
        }];
    
        UIView *container = [UIView new];
        [scrollView addSubview:container];
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(scrollView);
            make.width.equalTo(scrollView);
        }];
    
        int count = 10;
        __block UIView *lastView = nil;
    
        for (int i = 1; i<=count; i++) {
            UIView *subv = [UIView new];
            [container addSubview:subv];
            subv.backgroundColor = [UIColor colorWithHue:(arc4random() % 256 / 256.0)
                                              saturation:(arc4random() % 128 / 256.0) + 0.5
                                              brightness:(arc4random() % 128 / 256.0) +0.5
                                                   alpha:1];
            [subv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.and.right.equalTo(container);
                make.height.mas_equalTo(@(20*i));
                if (lastView) {
                    make.top.mas_equalTo(lastView.mas_bottom);
                }
                else {
                    make.top.mas_equalTo(container.mas_top);
                }
                lastView = subv;
            }];
    
        }
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(lastView.mas_bottom);
        }];

}

- (void)setEqualPaddingHorizontalAndVertical {
    //等间隔的views
    UIView *sv11 = [UIView new];
    sv11.backgroundColor = [UIColor whiteColor];
    UIView *sv12 = [UIView new];
    sv12.backgroundColor = [UIColor greenColor];
    UIView *sv13 = [UIView new];
    sv13.backgroundColor = [UIColor redColor];
    UIView *sv21 = [UIView new];
    sv21.backgroundColor = [UIColor yellowColor];
    UIView *sv31 = [UIView new];
    sv31.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:sv11];
    [self.view addSubview:sv12];
    [self.view addSubview:sv13];
    [self.view addSubview:sv21];
    [self.view addSubview:sv31];
    
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(100, 90));
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [self.view distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [self.view distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
}
@end
