//
//  PeopleTableViewCell.h
//  Energy
//
//  Created by Jim on 2/26/16.
//  Copyright © 2016 Jim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleTableViewCell : UITableViewCell

{
    UILabel         *quoteLabel;
    UIImageView     *rightSmallImageView;
  }

@property(nonatomic,retain)UILabel      *quoteLabel;
@property(nonatomic,retain)UIImageView  *rightSmallImageView;

@end
