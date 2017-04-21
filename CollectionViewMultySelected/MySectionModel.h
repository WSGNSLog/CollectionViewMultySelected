//
//  MySectionModel.h
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MySectionModel : NSObject
/** 分区头部名称 */
@property (nonatomic,strong) NSString * secTimeTitle;
/** 每个分组的数组 */
@property (nonatomic,strong) NSMutableArray * itemsArr;
@end
