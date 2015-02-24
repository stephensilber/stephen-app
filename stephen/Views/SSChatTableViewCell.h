//
//  SSChatTableViewCell.h
//  stephen
//
//  Created by Stephen Silber on 2/23/15.
//  Copyright (c) 2015 stephensilber. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SSChatCellSide) {
    SSChatCellSide_Left,
    SSChatCellSide_Right
};

typedef NS_ENUM(NSInteger, SSChatCellContentType) {
    SSChatCellSide_Text,
    SSChatCellSide_Image,
    SSChatCellSide_Location
};

@interface SSChatTableViewCell : UITableViewCell

- (void)configureWithInfo:(NSDictionary *)info;

@property (nonatomic) SSChatCellSide chatSide;

@end
