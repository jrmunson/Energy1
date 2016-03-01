//
//  PeopleTableViewCell.m
//  Energy
//
//  Created by Jim on 2/26/16.
//  Copyright © 2016 Jim. All rights reserved.
//

#import "PeopleTableViewCell.h"

@implementation PeopleTableViewCell

@synthesize quoteLabel;
@synthesize rightSmallImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        quoteLabel = [[UILabel alloc]init];
        quoteLabel.font = [UIFont fontWithName:@"Aril" size:10];
        quoteLabel.numberOfLines = 3;
        rightSmallImageView = [[UIImageView alloc]init];
        
        // the order in which these views are added createes the order in which they are
        // displayed, so to get the numeric label to overlay the myimageview, add it after the
        // myimageview.
        
        [self.contentView addSubview:quoteLabel];
        [self.contentView addSubview:rightSmallImageView];
      
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect contentRect = self.contentView.bounds;
    CGFloat boundsX = contentRect.origin.x;
    CGRect frame;
    // left margin, top margin, width, height
    
    frame= CGRectMake(boundsX+ 280, 25, 30, 30);
    rightSmallImageView.backgroundColor = [UIColor clearColor];
    rightSmallImageView.frame = frame;

 //   frame= CGRectMake(boundsX+ 45, 1, 200, 40);// quote
    frame= CGRectMake(boundsX+ 10, 1, 250, 80);// quote
    quoteLabel.backgroundColor = [UIColor clearColor];
    quoteLabel.frame = frame;

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
