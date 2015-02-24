//
//  SSChatTableViewController.m
//  stephen
//
//  Created by Stephen Silber on 2/23/15.
//  Copyright (c) 2015 stephensilber. All rights reserved.
//

#import "SSChatTableViewController.h"
#import "SSChatTableViewCell.h"

@interface SSChatTableViewController ()

@end

@implementation SSChatTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.tableView.rowHeight = 120;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[SSChatTableViewCell class] forCellReuseIdentifier:@"chatCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SSChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chatCell" forIndexPath:indexPath];
    cell.chatSide = indexPath.row % 2 ? SSChatCellSide_Left : SSChatCellSide_Right;
    return cell;
}

@end
