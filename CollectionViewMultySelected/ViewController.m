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
#import "MySectionModel.h"

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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectAll;


@end


static NSString *const ID = @"cell";
static NSString *const HeaderID = @"header";
static NSString *const FooterID = @"footer";

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
    
    for (int i=0; i<5; i++) {
        MySectionModel *secModel = [[MySectionModel alloc]init];
        for (int j=0; j<5; j++) {
            MyCellModel *model = [[MyCellModel alloc]init];
            [secModel.itemsArr addObject:model];
        }
        [self.dataSource addObject:secModel];
    }
    
    [self setUpCollectionView];
    
}

- (void)setUpCollectionView{
    UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc]init];
    flayout.itemSize = CGSizeMake(WWidth / 5, WWidth / 5);
    flayout.minimumInteritemSpacing = 5;
    flayout.minimumLineSpacing = 5;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0, WWidth, WHeight-44) collectionViewLayout:flayout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.dataSource =self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:ID];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];
    _collectionView.autoresizingMask = NO;
    _collectionView.allowsMultipleSelection = YES;
    [self.view addSubview:_collectionView];
}
#pragma mark - collectionView代理方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
    return self.dataSource.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
    MySectionModel *secModel = _dataSource[section];
    return [secModel.itemsArr count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *mCell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    MySectionModel *secModel = _dataSource[indexPath.section];
    
    MyCellModel *model = secModel.itemsArr[indexPath.row];
    mCell.mCellModel  = model;
    
    return mCell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderID forIndexPath:indexPath];
        //MySectionModel *secModel = self.dataSource[indexPath.section];
        
        if (header.subviews.lastObject!=nil) {
            [header.subviews.lastObject removeFromSuperview];
        }
        //NSString *dateStr = [secModel.secTimeTitle substringToIndex:6];
        //NSDate *date = [TimeTool dateFromString:dateStr];
        //NSString *showTime = [TimeTool timeYearAndMonthStr:date];
        UILabel *sectionTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, 200, 30)];
        sectionTitleLabel.text = @"666";
        sectionTitleLabel.font = [UIFont systemFontOfSize:15];
        [header addSubview:sectionTitleLabel];
        return  header;
        
    }else if(kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:FooterID forIndexPath:indexPath];
        return  footer;
    }else{
        return nil;
    }
}

//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
//    
//    if (self.allUStime>self.videoLimitTime) {
//        [MBProgressHUD showError:@"已超过5min时长限制"];
//        return NO;
//    }else {
//        return YES;
//    }
//}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = (MyCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    MySectionModel *secModel = self.dataSource[indexPath.section];
    MyCellModel *itemModel = secModel.itemsArr[indexPath.row];
    itemModel.isSelect = cell.isSelected;
    itemModel.indexPath = indexPath;
    NSLog(@"选中的视频：index=%d",(int)indexPath.row);
    
    
    itemModel.selectedIndex = (int)self.selectedItemsArr.count +1;//放在添加到数组后面，否则第一个索引会为0
    [self.selectedItemsArr addObject:itemModel];
    
    cell.mCellModel = itemModel;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCell *cell = (MyCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    MySectionModel *secModel = self.dataSource[indexPath.section];
    MyCellModel *deselectModel = secModel.itemsArr[indexPath.row];
    deselectModel.isSelect = cell.isSelected;
    //取消选中的item索引
    int deselectedIndex = deselectModel.selectedIndex;
    //    deselectModel.selectedIndex = 0;
    //    self.alltime -= deselectModel.sec;
    
    cell.mCellModel = deselectModel;
    //取消选中的不是最后一个时,把取消选中的这个后面的所有item重新排序
    if (deselectedIndex < self.selectedItemsArr.count) {
        for (int i = deselectedIndex; i<=self.selectedItemsArr.count; i++) {
            //            NSLog(@"=%d-%d---%ld--count=%ld",i,deselectedIndex,indexPath.row,self.selectedItemsArr.count);
            MyCellModel *mdel = self.selectedItemsArr[i-1];
            mdel.selectedIndex-=1;
            NSIndexPath *indexP = mdel.indexPath;
            MyCell *refreshItem = (MyCell *)[_collectionView cellForItemAtIndexPath:indexP];
            refreshItem.mCellModel = mdel;
            //2016-11-30 修复bug:12040
            [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
        }
    }
    
    [self.selectedItemsArr removeObjectAtIndex:(deselectedIndex-1)];
    
    if (self.selectedItemsArr.count<1) {
        
    }else{
        
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{   CGFloat margin = 5;
    CGFloat width = (WWidth -margin*5)/4;
    return CGSizeMake(width, width);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(WWidth, 10);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(WWidth, 45);
}
- (IBAction)selectAll:(UIBarButtonItem *)sender {
    
    
}
- (IBAction)delete:(id)sender {
}

@end
