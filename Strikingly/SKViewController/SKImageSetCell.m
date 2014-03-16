//
//  SKImageSetCell.m
//  Strikingly
//
//  Created by Tu You on 14-3-16.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import "SKImageSetCell.h"

#define kNumberOfThumbInCell (3)
#define kOffsetOfThumbInCell (10)

@interface SKImageSetCell ()

@end

@implementation SKImageSetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat xPos = kOffsetOfThumbInCell;
        CGFloat length = (CGRectGetWidth(self.frame) - (kNumberOfThumbInCell + 1) * kOffsetOfThumbInCell) / kNumberOfThumbInCell;
        
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 0, length, length)];
        [self addSubview:self.leftImageView];
        
        xPos += (length + kOffsetOfThumbInCell);
        self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 0, length, length)];
        [self addSubview:self.centerImageView];
        
        xPos += (length + kOffsetOfThumbInCell);
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xPos, 0, length, length)];
        [self addSubview:self.rightImageView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
