//
//  GPBaseViewCell.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseViewCell.h"
#import "GPBaseMediasModel.h"
#import "GPBaseActivityModel.h"
#import "UIKit+AFNetworking.h"

@interface GPBaseViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;

@property (weak, nonatomic) IBOutlet UIView *myView;


@end


@implementation GPBaseViewCell

+ (id)baseViewCellWithCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath andIdentifier:(NSString *)identifier
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    GPBaseViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}


- (void)setActivityModel:(GPBaseActivityModel *)activityModel
{
    _activityModel = activityModel;
    
    GPBaseMediasModel *mediasModel = activityModel.mediasModels[0];
    [self.imageView setImageWithURL:[NSURL URLWithString:mediasModel.m_url]];
    //把iamgeView设置成圆形
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width/2;
    self.imageView.layer.masksToBounds = YES;
    //文字底设置成圆角
    self.myView.layer.cornerRadius = 10;
    self.titleLabel.text = activityModel.title;
    self.tagLabel.text = activityModel.tag;
    self.addressLabel.text = activityModel.address;
    self.showTimeLabel.text = [NSString stringWithFormat:@"%@ %@", activityModel.category_name, activityModel.time_str];
    
}


@end
