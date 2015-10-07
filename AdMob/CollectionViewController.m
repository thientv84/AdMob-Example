//
//  CollectionViewController.m
//  AdMob
//
//  Created by Plunien, Johannes on 07/10/15.
//  Copyright © 2015 eBay Kleinanzeigen. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CollectionViewController.h"

static NSString *CellIdentifier = @"Cell";

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.text = [NSString stringWithFormat:@"cell %zd", indexPath.row];
    return cell;
}

@end
