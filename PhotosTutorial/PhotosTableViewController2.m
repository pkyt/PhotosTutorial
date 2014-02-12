//
//  PhotosTableViewController2.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotosTableViewController2.h"
#import "PhotoViewController.h"
#import "PhotosTutorialSilgleton.h"

@interface PhotosTableViewController2 ()

- (void)doNothing;

@end

@implementation PhotosTableViewController2

- (void)doNothing{
    NSLog(@"hello do Nothing");
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // PhotoViewController* pictureView = [PhotoViewController new];

    
    UITableViewCell* aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                       reuseIdentifier:nil];
    UILabel* detail = [UILabel new];
    detail.text = @"right detail";
    aCell.textLabel.text = @"hello cell";
    aCell.detailTextLabel.text = @"hello detail";
    aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    aCell.selectionStyle = UITableViewCellSelectionStyleBlue;
    aCell.userInteractionEnabled = YES;
    UIButton * switching = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    [switching addTarget:self action:@selector(doNothing) forControlEvents:UIControlEventTouchUpInside];
    [aCell addSubview:switching];
    // [self.navigationController pushViewController:pictureView animated:YES];
    [_SBDTable addSubview:aCell];
    NSLog(@"bay viewDidLoad");
    // add cells the way I want it
}

/*

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hello (void)tablVeiw");
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSLog(@"hello number of sections");
    return 1;
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"hello creating cell");
    static NSString * cellIdenifier = @"Cell";
    UITableViewCell * aCell = [tableView dequeueReusableCellWithIdentifier:cellIdenifier];
    if (aCell == nil) {
        aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdenifier];
    }
    aCell.textLabel.text = [array objectAtIndex:indexPath.row];
    return aCell;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"hello number of rows");
    return [array count];
}

*/
 
@end
