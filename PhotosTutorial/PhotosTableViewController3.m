//
//  PhotosTableViewController3.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/13/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotosTableViewController3.h"
#import "PhotoViewController.h"
#import "PhotoKeeper.h"
#include "PhotosTutorialSilgleton.h"

@interface PhotosTableViewController3 ()

@end

@implementation PhotosTableViewController3

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    [[PhotosTutorialSilgleton getPhotos] sortByMRV];
    NSLog(@"bay viewDidLoad");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[PhotosTutorialSilgleton getPhotos] getNumberOfPhotos];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * const cellIdentifier = @"MyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    PhotosTutorialSilgleton* photos = [PhotosTutorialSilgleton getPhotos];
    PhotoKeeper* photoData = [photos getPhotoSortedByMRVAt:indexPath.row];
    cell.textLabel.text = [photoData getName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", [photoData getCountOfViewed]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[[PhotosTutorialSilgleton getPhotos] getPhotoSortedByMRVAt:indexPath.row] fileViewed];
    [PhotosTutorialSilgleton setTrigger:indexPath.row withSortingMRV:YES];
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
}


@end
