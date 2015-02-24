//
//  SSChatTableViewCell.m
//  stephen
//
//  Created by Stephen Silber on 2/23/15.
//  Copyright (c) 2015 stephensilber. All rights reserved.
//

#import "SSChatTableViewCell.h"

#import <Masonry/Masonry.h>

@interface SSChatTableViewCell ()

@property (nonatomic) UIView *avatarContainer;
@property (nonatomic) UIView *bubbleBackground;
@property (nonatomic) CAShapeLayer *bubbleIndicator;

@property (nonatomic) UIImageView *avatarView;
@property (nonatomic) UILabel *avatarLabel;
@property (nonatomic) UILabel *bubbleLabel;
@property (nonatomic) UILabel *timestampLabel;

@end

@implementation SSChatTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.bubbleBackground = [[UIView alloc] initWithFrame:CGRectZero];
        self.bubbleBackground.layer.cornerRadius = 5.0f;
        self.bubbleBackground.backgroundColor = [UIColor colorWithWhite:0.868 alpha:1.000];
        
        self.bubbleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.bubbleLabel.numberOfLines = 0;
        self.bubbleLabel.textAlignment = NSTextAlignmentLeft;
        self.bubbleLabel.text = @"Open Xcode and Create a new project by choosing the Single View Application template. If you’re using XCode 6, choose";
        
        self.avatarContainer = [[UIView alloc] initWithFrame:CGRectZero];
        self.avatarContainer.layer.cornerRadius = 22;
        self.avatarContainer.backgroundColor = [UIColor darkGrayColor];
        
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.avatarView.clipsToBounds = YES;
        self.avatarLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.avatarLabel.text = @"SS";
        self.avatarLabel.textColor = [UIColor whiteColor];
        self.avatarLabel.textAlignment = NSTextAlignmentCenter;

        self.timestampLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self.contentView addSubview:self.bubbleBackground];
        [self.bubbleBackground addSubview:self.bubbleLabel];

        [self.contentView addSubview:self.avatarContainer];
        [self.avatarContainer addSubview:self.avatarView];
        [self.avatarContainer addSubview:self.avatarLabel];
        
        [self.bubbleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.bubbleBackground).with.insets(UIEdgeInsetsMake(5, 15, 5, 15));
        }];
        
        [self.avatarLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.avatarContainer);
        }];
    }
    
    return self;
}

- (void)setChatSide:(SSChatCellSide)chatSide
{
    _chatSide = chatSide;
    [self configureCellForSide:chatSide];
}

- (void)configureCellForSide:(SSChatCellSide)chatSide
{
    CGFloat leftInset  = 5;
    CGFloat rightInset = 5;
    
    switch (chatSide)
    {
        case SSChatCellSide_Left:
        {
            leftInset  = 75;
            rightInset = 30;
            
            [self.avatarContainer mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).with.offset(8);
                make.top.equalTo(self.contentView).with.offset(8);
                make.height.equalTo(@44);
                make.width.equalTo(@44);
            }];
        }
            break;
        case SSChatCellSide_Right:
            rightInset = 75;
            leftInset  = 30;
            
            [self.avatarContainer mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.contentView).with.offset(-8);
                make.top.equalTo(self.contentView).with.offset(8);
                make.height.equalTo(@44);
                make.width.equalTo(@44);
            }];
            
            break;
    }
    
    [self.bubbleBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(5, leftInset, 5, rightInset));
    }];
}

- (void)drawChatIndicatorForSide:(SSChatCellSide)chatSide
{
    self.bubbleIndicator = [[CAShapeLayer alloc] init];

    if (chatSide == SSChatCellSide_Left)
    {
        
    }
    else
    {
        
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)configureWithInfo:(NSDictionary *)info
{
    
}

@end
