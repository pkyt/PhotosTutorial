//
//  PhotosTutorialSilgleton.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotosTutorialSilgleton.h"
#import "PhotoKeeper.h"

@interface PhotosTutorialSilgleton()

@end

@implementation PhotosTutorialSilgleton

static NSMutableArray* listOfPhotos;
static PhotosTutorialSilgleton* this;
static NSInteger trg;


+ (void)setTrigger:(NSInteger)trigger{
    trg = trigger;
}

- (void)fillListOfPhotos{
    NSLog(@"hello fillListOfPhotos");
    NSString *documents = [@"/Users/pkyt/Desktop/PhotosTutorial/PhotosTutorial/Photos" stringByExpandingTildeInPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *direnum = [fileManager enumeratorAtPath:documents];
    NSString *tString;
    while ((tString = [direnum nextObject] ))
    {
        if ([tString hasSuffix:@".jpg"])
        {
            NSString *fileAbsPath = [NSString stringWithFormat:@"%@/%@",documents,tString];
            PhotoKeeper* file = [[PhotoKeeper alloc] initWithPathToFile:fileAbsPath];
            [listOfPhotos addObject:file];
            
        }
    }
    NSLog(@"DONE");
}

- (PhotoKeeper*)getTriggerPhoto{
    if (trg == -1) {
        NSLog(@"Trigger isn't supposed to be -1");
        trg = 0;
    }
    return [listOfPhotos objectAtIndex:trg];
}

+ (id)getPhotos{
    if (!this) {
        this = [PhotosTutorialSilgleton new];
        listOfPhotos = [NSMutableArray new];
    }
    return this;
}

- (NSUInteger)getNumberOfPhotos{
    return [listOfPhotos count];
}

- (PhotoKeeper*)getPhotoKeeperAt:(NSUInteger)position{
    return [listOfPhotos objectAtIndex:position];
}

- (NSInteger)positionWithName:(NSString*)name{
    for (int i = 0; i < [listOfPhotos count]; i++) {
        if ([[listOfPhotos objectAtIndex:i] isEqualToString:name]) {
            return i;
        }
    }
    return -1;
}


@end
