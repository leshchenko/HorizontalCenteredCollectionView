//
//  HorizontalCenteredCollectionView.m
//  HorizontalCenteredCollectionView
//
//  Created by Ruslan on 1/2/19.
//  Copyright © 2019 leshchenko. All rights reserved.
//

#import "HorizontalCenteredCollectionView.h"
#import "HorizontalCenteredCollectionViewFlowLayout.h"

@interface HorizontalCenteredCollectionView()
        <UICollectionViewDelegate,
        UICollectionViewDelegateFlowLayout>

@property UICollectionViewFlowLayout * flowLayout;

@end

@implementation HorizontalCenteredCollectionView

- (instancetype)initWithFrame:(CGRect)frame
         collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame
           collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.currentActiveCellPath = [NSIndexPath indexPathForRow:0
                                                        inSection:0];
        self.collectionViewLayout = layout;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.delegate = self;
        self.currentActiveCellPath = [NSIndexPath indexPathForRow:0
                                                        inSection:0];
        self.collectionViewLayout = [HorizontalCenteredCollectionViewFlowLayout new];
    }
    return self;
}

- (CGSize) cellSize
{
    return CGSizeMake(250, self.frame.size.height);
}

- (CGFloat) calculateSectionInset:(UICollectionView *)collectionView
{
    return (collectionView.frame.size.width - [self cellSize].width)/2;
}

- (UIEdgeInsets) collectionView:(UICollectionView *)collectionView
                         layout:(UICollectionViewLayout *)collectionViewLayout
         insetForSectionAtIndex:(NSInteger)section
{
    CGFloat inset = [self calculateSectionInset:collectionView];
    return UIEdgeInsetsMake(0, inset, 0, inset);
}

- (CGSize) collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self cellSize];
}


- (void) scrollToItemAtIndexPath:(NSIndexPath *)indexPath
                  withScrollView:(UIScrollView *)scrollView
                     andVelocity:(CGPoint)velocity
{
    [UIView animateWithDuration:0.3
                          delay:0
         usingSpringWithDamping:1
          initialSpringVelocity:velocity.x
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations: ^{
                         
                         scrollView.contentOffset = CGPointMake(indexPath.row * [self cellSize].width, 0);
                         [scrollView layoutIfNeeded];
                     }
                     completion:nil];
}



- (void) scrolltoItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.currentActiveCellPath = indexPath;
    [self scrollToItemAtIndexPath:indexPath
                 atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                         animated:true];
}

#pragma mark ScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset
{
    // Stop scrollView sliding:
    targetContentOffset->x = scrollView.contentOffset.x;
    targetContentOffset->y = scrollView.contentOffset.y;
    
    NSInteger cellIndexBeforeDragging = self.currentActiveCellPath.row;
    if (fabs(velocity.x) <= 0.5) {
        
        NSIndexPath * indexPath = [NSIndexPath indexPathForRow:cellIndexBeforeDragging
                                                     inSection:0];
        [self scrollToItemAtIndexPath:indexPath
                     atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                             animated:true];
        return;
    }
    // calculate where scrollView should snap to:
    NSInteger indexOfMajorCell = 0;
    
    if (velocity.x > 0) {
        
        if (cellIndexBeforeDragging + 1 > [self.dataSource collectionView:self
                                                   numberOfItemsInSection:0] - 1) {
            
            indexOfMajorCell = cellIndexBeforeDragging;
        }
        else {
        
            indexOfMajorCell = cellIndexBeforeDragging + 1;
        }
    }
    else {
        
        if (cellIndexBeforeDragging - 1 <= 0) {
            
            indexOfMajorCell = 0;
        }
        else {
            
            indexOfMajorCell = cellIndexBeforeDragging - 1;
        }
    }
    
    self.currentActiveCellPath = [NSIndexPath indexPathForRow:indexOfMajorCell
                                                    inSection:0];
    [self scrollToItemAtIndexPath:self.currentActiveCellPath
                   withScrollView:scrollView
                      andVelocity:velocity];
}

@end
