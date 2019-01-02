//
//  HorizontalCenteredCollectionView.h
//  HorizontalCenteredCollectionView
//
//  Created by Ruslan on 1/2/19.
//  Copyright © 2019 leshchenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalCenteredCollectionView : UICollectionView

@property NSIndexPath * currentActiveCellPath;

- (CGSize) cellSize;

@end
