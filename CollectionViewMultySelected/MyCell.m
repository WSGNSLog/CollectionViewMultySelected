




//
//  MyCell.m
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import "MyCell.h"
#import "MyCellModel.h"

@implementation MyCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageV = [[UIImageView alloc]init];
        [self addSubview:self.imageV];
        
        _timeBgImgV = [[UIImageView alloc]init];
        _timeBGView = [[UIView alloc]init];
        [self.timeBGView addSubview:self.timeBgImgV];
        
        _timeLable = [[UILabel alloc]init];
        [self.timeBGView addSubview:self.timeLable];
        _playBtn = [[UIButton alloc]init];
        [self.timeBGView addSubview:self.playBtn];
        [self addSubview:self.timeBGView];
        
        _selectBGImageV = [[UIImageView alloc]init];
        _selecteIndexLabel = [[UILabel alloc]init];
        [_selectBGImageV addSubview:_selecteIndexLabel];
        [self addSubview:self.selectBGImageV];
        _selectBGImageV.hidden = YES;
        
        self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    self.imageV.frame = self.bounds;
    self.timeBgImgV.frame = CGRectMake(0, height-30, width, 30);
    self.timeBgImgV.backgroundColor  = [UIColor clearColor];
    self.timeBgImgV.image = [UIImage imageNamed:@"allVideoTimeBar"];
    self.playBtn.frame = CGRectMake(width - 20, height - 21, 17, 17);
    [self.playBtn setBackgroundImage:[UIImage imageNamed:@"AllVideoSymbols"] forState:UIControlStateNormal];
    self.timeLable.frame  = CGRectMake((width-width/3.0-10)/2.0, height - 22, width /3.0+10, 20);
    //    self.timeLable.frame  = CGRectMake(0, height - 65, width , 20);
    self.timeLable.font = [UIFont systemFontOfSize:11];
    self.timeLable.textColor = [UIColor whiteColor];
    _selectBGImageV.frame = self.bounds;
    _selectBGImageV.layer.borderWidth = 4;
    _selectBGImageV.layer.borderColor = [UIColor colorWithRed:47/255.0f green:185/255.0f blue:195/255.0f alpha:1.00f].CGColor;
    _selectBGImageV.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4];
    _selecteIndexLabel.frame = CGRectMake(width/3/2, width/3/2, width/3*2, width/3*2);
    _selecteIndexLabel.textAlignment = NSTextAlignmentCenter;
    _selecteIndexLabel.font = [UIFont fontWithName:@"Heiti SC" size:36];
    _selecteIndexLabel.textColor = [UIColor colorWithRed:0.19f green:0.73f blue:0.76f alpha:1.00f];
}

- (void)setMCellModel:(MyCellModel *)mCellModel
{
    if (mCellModel.isSelect) {
        //        [self setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];
        self.selecteIndexLabel.text = [NSString stringWithFormat:@"%d",mCellModel.selectedIndex];
        self.selectBGImageV.hidden = NO;
    }else{
        //        [self setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];
        self.selectBGImageV.hidden = YES;
    }
    //    [self layoutIfNeeded];
}
@end
