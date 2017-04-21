//
//  MyCellModel.h
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCellModel : NSObject
/** 被选中的次序 */
@property (nonatomic,assign) int selectedIndex;

@property (nonatomic,assign) BOOL isSelect;

@end
