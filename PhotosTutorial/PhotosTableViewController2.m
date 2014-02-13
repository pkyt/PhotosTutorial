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
    NSLog(@"bay viewDidLoad");
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
    PhotoKeeper* photoData = [photos getPhotoSortedByNameAt:indexPath.row];
    
    
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
    [PhotosTutorialSilgleton setTrigger:indexPath.row withSortingMRV:NO];
    PhotoViewController * pictureView = [[PhotoViewController alloc] init];
    [self.navigationController pushViewController:pictureView animated:YES];
}

@end
