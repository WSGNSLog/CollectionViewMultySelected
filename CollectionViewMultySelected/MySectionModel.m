


//
//  MySectionModel.m
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import "MySectionModel.h"

@implementation MySectionModel
- (NSMutableArray *)itemsArr
{
    if (!_itemsArr) {
        _itemsArr = [NSMutableArray array];
    }
    return _itemsArr;
}
@end
