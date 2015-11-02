//
//  GPBaseSecondViewCell.m
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import "GPBaseSecondViewCell.h"
#import "GPBaseSecondViewCell.h"
#import "GPBaseMediasModel.h"
#import "GPBaseActivityModel.h"
#import "UIKit+AFNetworking.h"


@interface GPBaseSecondViewCell() <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *showTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation GPBaseSecondViewCell


+ (id)baseSecondViewCellWithCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath andIdentifier:(NSString *)identifier
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:identifier];
    
    GPBaseSecondViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}


- (void)setActivityModel:(GPBaseActivityModel *)activityModel
{
    _activityModel = activityModel;
    _activityModel = activityModel;
    GPBaseMediasModel *mediasModel = activityModel.mediasModels[0];
    [self.imageView setImageWithURL:[NSURL URLWithString:mediasModel.m_url]];
    self.myView.layer.cornerRadius = 10;
    self.titleLabel.text = activityModel.title;
    self.tagLabel.text = activityModel.tag;
    self.showTimeLabel.text =  activityModel.time_str;
}




@end
