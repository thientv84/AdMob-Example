//
//  CollectionViewCell.m
//  AdMob
//
//  Created by Plunien, Johannes on 07/10/15.
//  Copyright © 2015 eBay Kleinanzeigen. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation CollectionViewCell

- (void)setText:(NSString *)text
{
    self.textLabel.text = text;
}

@end
