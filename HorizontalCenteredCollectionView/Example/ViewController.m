//
//  ViewController.m
//  HorizontalCenteredCollectionView
//
//  Created by Ruslan on 1/2/19.
//  Copyright © 2019 leshchenko. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalCenteredCollectionView.h"
#import "HorizontalCenteredCollectionViewFlowLayout.h"
#import "CenteredCollectionViewCell.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet HorizontalCenteredCollectionView * horizontalCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.horizontalCollectionView.dataSource = self;
    [self.horizontalCollectionView registerNib:[UINib nibWithNibName:NSStringFromClass(CenteredCollectionViewCell.class)
                                                              bundle:NSBundle.mainBundle]
                    forCellWithReuseIdentifier:NSStringFromClass(CenteredCollectionViewCell.class)];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CenteredCollectionViewCell class])
                                                     forIndexPath:indexPath];
}
- (NSInteger) collectionView:(UICollectionView *)collectionView
      numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


@end
