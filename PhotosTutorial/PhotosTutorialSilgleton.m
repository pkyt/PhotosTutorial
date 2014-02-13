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
- (void)sortByND; // first soring by Name, second by Date
@end

@implementation PhotosTutorialSilgleton

static NSMutableArray* listOfPhotos;
static NSMutableArray* NDlistOfPhotos;
static NSMutableArray* MRVlistOfPhotos;
static PhotosTutorialSilgleton* this;
static NSInteger trg;
static BOOL MostRecentlyViewed;


+ (void)setTrigger:(NSInteger)trigger withSortingMRV:(BOOL)MRV{
    MostRecentlyViewed = MRV;
    trg = trigger;
}

- (void)sortByMRV{
    if (!MRVlistOfPhotos) {
        MRVlistOfPhotos = [NSMutableArray new];
    }
    [MRVlistOfPhotos removeAllObjects];
    for (int i = 0; i < [listOfPhotos count]; i++) {
        PhotoKeeper* photo = [listOfPhotos objectAtIndex:i];
        int j;
        for (j = 0; j < [MRVlistOfPhotos count]; j++) {
            if ([photo getCountOfViewed] > [[MRVlistOfPhotos objectAtIndex:j] getCountOfViewed]) {
                break;
            }else{
                if (([photo getCountOfViewed] == [[MRVlistOfPhotos objectAtIndex:j] getCountOfViewed]) &&
                    ([[photo getName] compare:[[MRVlistOfPhotos objectAtIndex:j] getName]] == NSOrderedAscending)) {
                    break;
                }
            }
        }
        [MRVlistOfPhotos insertObject:photo atIndex:j];
    }
}

- (void)sortByND{
    NDlistOfPhotos = [NSMutableArray new];
    for (int i = 0; i < [listOfPhotos count]; i++) {
        PhotoKeeper* photo = [listOfPhotos objectAtIndex:i];
        int j;
        for (j = 0; j < [NDlistOfPhotos count]; j++) {
            if ([[photo getName] compare:[[NDlistOfPhotos objectAtIndex:j] getName]] == NSOrderedAscending) {
                break;
            }else{
                if (([[photo getDate] earlierDate:[[NDlistOfPhotos objectAtIndex:j] getDate]]) &&
                    ([[photo getName] isEqualToString:[[NDlistOfPhotos objectAtIndex:j] getName]])) {
                    break;
                }
            }
        }
        [NDlistOfPhotos insertObject:photo atIndex:j];
    }
}

- (void)fillListOfPhotos{
    NSLog(@"hello fillListOfPhotos");
    
    [[NSBundle mainBundle] bundlePath];
    NSLog(@"%@", [[NSBundle mainBundle] bundlePath]);
    [[NSBundle mainBundle] pathForResource:@"Lviv" ofType:@"jpg"];
    NSString *documents = [[[NSBundle mainBundle] bundlePath] stringByExpandingTildeInPath];
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
    [self sortByND];
    NSLog(@"DONE");
}

- (PhotoKeeper*)getPhotoSortedByNameAt:(NSUInteger)position{
    return [NDlistOfPhotos objectAtIndex:position];
}

- (PhotoKeeper*)getPhotoSortedByMRVAt:(NSUInteger)position{
    return [MRVlistOfPhotos objectAtIndex:position];
}

- (PhotoKeeper*)getTriggerPhoto{
    if (trg == -1) {
        NSLog(@"Trigger isn't supposed to be -1");
        trg = 0;
    }
    if (MostRecentlyViewed) {
        return [listOfPhotos objectAtIndex:trg];
    }else{
        return [NDlistOfPhotos objectAtIndex:trg];
    }
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
