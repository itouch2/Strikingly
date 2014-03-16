//
//  SKImageSetCell.h
//  Strikingly
//
//  Created by Tu You on 14-3-16.
//  Copyright (c) 2014年 Tu You. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKImageSetCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *leftNameLabel;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UILabel *centerNameLabel;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UILabel *rigthLabel;

@end
