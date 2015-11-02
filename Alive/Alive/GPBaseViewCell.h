//
//  GPBaseViewCell.h
//  Alive
//
//  Created by qianfeng on 15-5-28.
//  Copyright (c) 2015年 程志鹏. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GPBaseActivityModel;
@interface GPBaseViewCell : UICollectionViewCell

@property (nonatomic, strong)GPBaseActivityModel *activityModel;

+ (id)baseViewCellWithCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath andIdentifier:(NSString *)identifier;

@end
