//
//  ZCIngredientsDataModel.h
//  iZhangChu
//
//  Created by Shengping on 17/4/24.
//  Copyright © 2017年 iDress. All rights reserved.
//  食材数据

#import <Foundation/Foundation.h>

@interface ZCIngredientsDataModel : NSObject

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) NSArray *data;

/**
 用来标记该model对应的cell是否选中
 */
@property (nonatomic, assign) BOOL selected;

@end
