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

- (void)doNothing:(UIButton*)sender;

@end

@implementation PhotosTableViewController2

@synthesize SBDTable = _SBDTable;

- (void)doNothing:(UIButton*)sender{
    NSLog(@"hello do Nothing: %@", sender.currentTitle);
    
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // UITableViewCell* aCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
    //                                   reuseIdentifier:nil];
    PhotosTutorialSilgleton* setOfPhotos = [PhotosTutorialSilgleton getPhotos];
    NSLog(@"%lu", [setOfPhotos getNumberOfPhotos]);
    for (int i = 0; i < [setOfPhotos getNumberOfPhotos]; i++) {
        NSLog(@"%lu", i);
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
    }
    
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

@end
