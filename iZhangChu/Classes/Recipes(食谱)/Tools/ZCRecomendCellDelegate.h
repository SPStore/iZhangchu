//
//  ZCRecomendCellDelegate.h
//  iZhangChu
//
//  Created by Shengping on 17/4/29.
//  Copyright © 2017年 iDress. All rights reserved.
//  推荐中的cell代理

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZCRecommendButtonCellButtonType) {
    ZCRecommendButtonCellButtonTypeBasicIntroduce = 1,      // 新手入门
    ZCRecommendButtonCellButtonTypeIngredientsCollocation,  // 食材搭配
    ZCRecommendButtonCellButtonTypeSceneRecipes,            // 场景菜谱
    ZCRecommendButtonCellButtonTypeFoodLive                 // 美食直播
};

@class ZCRecommendWidgetItem;
@class ZCRecommendImageViewTitleModel;
@class ZCRecommendVideoModel;

@protocol ZCRecomendCellDelegate <NSObject>

@optional;
- (void)recommendButtonOnButtonCellClickedWithButtonType:(ZCRecommendButtonCellButtonType)btnType;

- (void)recommendCanScrollCellImageClickedWithItem:(ZCRecommendWidgetItem *)item;

- (void)recommendTitleCellClickedWithModel:(ZCRecommendImageViewTitleModel *)model;

// 点击了今日新品cell上的view
- (void)recommendVideoCellVideoItemViewClicked:(ZCRecommendWidgetItem *)item;
@end

