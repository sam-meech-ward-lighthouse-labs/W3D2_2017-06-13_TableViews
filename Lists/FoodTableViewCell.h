//
//  FoodTableViewCell.h
//  Lists
//
//  Created by Sam Meech-Ward on 2017-06-13.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *foodImageView;
@property (weak, nonatomic) IBOutlet UILabel *foodLabel;

@end
