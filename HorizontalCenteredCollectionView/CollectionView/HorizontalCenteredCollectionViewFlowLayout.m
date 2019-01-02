//
//  HorizontalCenteredCollectionViewFlowLayout.m
//  HorizontalCenteredCollectionView
//
//  Created by Ruslan on 1/2/19.
//  Copyright © 2019 leshchenko. All rights reserved.
//


#import "HorizontalCenteredCollectionViewFlowLayout.h"

@implementation HorizontalCenteredCollectionViewFlowLayout

- (id)init
{
    self = [super init];
    if (self) {
        
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
    }
    return self;
}

@end
