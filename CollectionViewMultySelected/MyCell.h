//
//  MyCell.h
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCellModel;
@interface MyCell : UICollectionViewCell
/** 预览图 */
@property (nonatomic,strong) UIImageView * imageV;
/** 播放按钮 */
@property (nonatomic,strong) UIButton * playBtn;

/** 时间lable */
@property (nonatomic,strong) UILabel * timeLable;
/** cellModel */
@property (nonatomic,strong)  MyCellModel * mCellModel;

/** 选中时的背景 */
@property (nonatomic,strong) UIImageView * selectBGImageV;
/** 选中时index */
@property (nonatomic,strong) UILabel * selecteIndexLabel;

/** 时间显示的背景 */
@property (nonatomic,strong) UIView * timeBGView;
@property (nonatomic,strong) UIImageView * timeBgImgV;
@end
