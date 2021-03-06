//
//  ZCPlayImageView.m
//  iZhangChu
//
//  Created by Shengping on 17/4/21.
//  Copyright © 2017年 iDress. All rights reserved.
//

#import "ZCPlayImageView.h"
#import <UIImageView+WebCache.h>
#import "ZCVideoViewController.h"

@interface ZCPlayImageView()
@property (nonatomic, strong) UIButton *playButton;

@end

@implementation ZCPlayImageView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubControl];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self addSubControl];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)setImageItem:(ZCRecommendWidgetItem *)imageItem {
    _imageItem = imageItem;
    [self sd_setImageWithURL:[NSURL URLWithString:imageItem.content] placeholderImage:nil];
}

- (void)setVideoItem:(ZCRecommendWidgetItem *)videoItem {
    _videoItem = videoItem;
}

- (void)addSubControl {
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton setImage:[UIImage imageNamed:@"love_Play_Icon"] forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(playButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.playButton];

}

- (void)setPlayButtonPosition:(ZCPlayImageViewPlayButtonPosition)playButtonPosition {
    _playButtonPosition = playButtonPosition;
    [self layoutIfNeeded];
}

- (void)playButtonAction:(UIButton *)sender {
    ZCVideoViewController *videoVc = [[ZCVideoViewController alloc] init];
    videoVc.title = self.title;
    videoVc.videoUrlString = self.videoUrlString;
    [[self viewController] presentViewController:videoVc animated:YES completion:nil];
}

- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = self.frame.size.width*0.25;
    CGFloat h = w;
    CGFloat x = self.frame.size.width - 1.5 * w;
    CGFloat y = self.frame.size.height - 1.5 * h;
    
    CGRect frame = self.playButton.frame;
    frame.size = CGSizeMake(w, h);
    self.playButton.frame = frame;
    
    if (self.playButtonPosition == ZCPlayImageViewPlayButtonPositionCenter) {
        self.playButton.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    } else {
        self.playButton.frame = CGRectMake(x, y, w, h);
    }
    
    
}

@end







