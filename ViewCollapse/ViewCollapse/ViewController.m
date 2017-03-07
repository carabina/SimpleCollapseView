//
//  ViewController.m
//  ViewCollapse
//
//  Created by Luis Teodoro on 07/03/17.
//  Copyright © 2017 Luis Teodoro. All rights reserved.
//

#import "ViewController.h"
#import "CollapseViewCollectionViewCell.h"

#define CollapsedHeight 80.0f
#define ExpandedHeight  415.0f


@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property BOOL collapseOpened;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollapseViewCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB"];
    
    self.collapseOpened = NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            CollapseViewCollectionViewCell *collapse = (CollapseViewCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollapseViewCollectionViewCell_XIB" forIndexPath:indexPath];
            return collapse;
        }
            break;
            
        default:
        {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
            return cell;
        }
            break;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            self.collapseOpened = !self.collapseOpened;
            
            [UIView animateWithDuration:0.30
                                  delay:0.0f
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 [self.view layoutIfNeeded];
                             } completion:nil];
            
            CollapseViewCollectionViewCell *collapse = (CollapseViewCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
            collapse.isSelected = self.collapseOpened;
            [collectionView performBatchUpdates:nil completion:nil];
        }
            break;
        default:
            break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = collectionView.frame.size.width;
    
    switch (indexPath.row) {
        case 0:
        {
            CGFloat h = self.collapseOpened ? ExpandedHeight : CollapsedHeight;
            return CGSizeMake(width, h);
        }
            break;
        default:
            return CGSizeMake(width, 300);
            break;
    }
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0.0;
}

@end
