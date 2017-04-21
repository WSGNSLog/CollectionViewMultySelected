//
//  ViewController.m
//  CollectionViewMultySelected
//
//  Created by wuxue on 2017/4/21.
//  Copyright © 2017年 wsg. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "MyCellModel.h"

#define WWidth [UIScreen mainScreen].bounds.size.width
#define WHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/** 集合视图 */
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *dataSource;

/** 存储被选中的items */
@property (nonatomic, strong) NSMutableArray *selectedItemsArr;
/** 存储没有排序分组前的model */
@property (nonatomic, strong) NSMutableArray *tmpArr;
@end

@implementation ViewController
- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource =[NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableArray *)selectedItemsArr{
    if (!_selectedItemsArr) {
        _selectedItemsArr = [NSMutableArray array];
    }
    return _selectedItemsArr;
}

- (NSMutableArray *)tmpArr
{
    if (!_tmpArr) {
        _tmpArr =[NSMutableArray array];
    }
    return _tmpArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
