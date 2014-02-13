//
//  PhotosTutorialSilgleton.h
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoKeeper.h"

@interface PhotosTutorialSilgleton : NSObject

+ (id)getPhotos;
+ (void)setTrigger:(NSInteger)trigger withSortingMRV:(BOOL)MRV;
- (NSUInteger)getNumberOfPhotos;
- (void) fillListOfPhotos;
- (PhotoKeeper*)getPhotoKeeperAt:(NSUInteger)position;
- (PhotoKeeper*)getPhotoSortedByNameAt:(NSUInteger)position;
- (PhotoKeeper*)getPhotoSortedByMRVAt:(NSUInteger)position;
- (NSInteger)positionWithName:(NSString*)name;
- (PhotoKeeper*)getTriggerPhoto;
- (void)sortByMRV; // first soring by Count, second by Name

@end
