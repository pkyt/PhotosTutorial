//
//  PhotosTableViewController2.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotosTableViewController2.h"
#import "PhotoViewController.h"
#import "PhotoKeeper.h"
#include "PhotosTutorialSilgleton.h"

@interface PhotosTableViewController2 ()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation PhotosTableViewController2

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _items = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three", @"Four", nil];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    // UITableViewCell* aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
    //                                   reuseIdentifier:nil];
    /*
    NSLog(@"%lu", [setOfPhotos getNumberOfPhotos]);
    for (int i = 0; i < [setOfPhotos getNumberOfPhotos]; i++) {
        NSLog(@"%d", i);
        PhotoKeeper* photo = [setOfPhotos getPhotoKeeperAt:i];
        UITableViewCell* aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                                        reuseIdentifier:nil];
        aCell.textLabel.text = [photo getName];
        NSDateFormatter* formatter = [NSDateFormatter new];
        NSString* date = [formatter stringFromDate:[photo getDate]];
        aCell.detailTextLabel.text = date;
        aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        aCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        aCell.userInteractionEnabled = YES;
        UIButton * switching = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
        [switching setTitle:[photo getName] forState:UIControlStateNormal];
        [switching addTarget:self action:@selector(doNothing:) forControlEvents:UIControlEventTouchUpInside];
        [aCell addSubview:switching];
        [_SBDTable addSubview:aCell];
    }*/
    
    /*
    aCell.textLabel.text = @"hello cell";
    aCell.detailTextLabel.text = @"hello detail";
    aCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    aCell.selectionStyle = UITableViewCellSelectionStyleBlue;
    aCell.userInteractionEnabled = YES;
    UIButton * switching = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1000, 1000)];
    [switching setTitle:@"1234567890-" forState:UIControlStateNormal];
    [switching addTarget:self action:@selector(doNothing:) forControlEvents:UIControlEventTouchUpInside];
    [aCell addSubview:switching];
    // [self.navigationController pushViewController:pictureView animated:YES];
    [_SBDTable addSubview:aCell];
     */
    NSLog(@"bay viewDidLoad");
    // add cells the way I want it
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PhotosTutorialSilgleton getPhotos] getNumberOfPhotos];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"sth");
    static NSString * const cellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    PhotosTutorialSilgleton* photos = [PhotosTutorialSilgleton getPhotos];
    PhotoKeeper* photoData = [photos getPhotoKeeperAt:indexPath.row];
    
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [formatter setDateStyle:NSDateFormatterShortStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    NSString *date = [formatter stringFromDate:[photoData getDate]];
    cell.textLabel.text = [photoData getName];
    cell.detailTextLabel.text = date;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [PhotosTutorialSilgleton setTrigger:indexPath.row];
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
    
}

@end
