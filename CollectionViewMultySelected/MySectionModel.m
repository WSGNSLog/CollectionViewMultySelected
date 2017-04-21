


//
//  MySectionModel.m
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import "MySectionModel.h"

@implementation MySectionModel
- (NSArray *)itemsArr
{
    if (!_itemsArr) {
        _itemsArr = [NSArray array];
    }
    return _itemsArr;
}
@end
