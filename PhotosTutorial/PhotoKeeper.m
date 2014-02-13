//
//  PhotoKeeper.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotoKeeper.h"

@interface PhotoKeeper ()
@property NSString* path;
@property NSDate* date;
@property NSString* name;
@property NSUInteger count;

- (void)figureOutDate;
- (void)figureOutName;

@end

@implementation PhotoKeeper

@synthesize path = _path;
@synthesize date = _date;
@synthesize name = _name;
@synthesize count = _count;

- (void) figureOutDate{
    NSError *error;
    NSDictionary* fileAttributeDict = [[NSFileManager defaultManager]
                                       attributesOfItemAtPath:_path
                                                        error:&error];
    _date = fileAttributeDict.fileCreationDate;
}

- (void) figureOutName{
    NSUInteger position = [_path rangeOfString:@"/" options:NSBackwardsSearch].location;
    _name = [_path substringFromIndex:(position + 1)];
    _name = [_name substringToIndex:(_name.length - 4)];
}

- (id)initWithPathToFile:(NSString *)pathToPhoto{
    _path = pathToPhoto;
    _count = 0;
    [self figureOutDate];
    [self figureOutName];
    return self;
}

- (NSString *)getPath{
    return self.path;
}

- (NSDate*) getDate{
    return self.date;
}
- (NSString*) getName{
    return self.name;
}

- (void)fileViewed{
    _count++;
}

- (NSUInteger)getCountOfViewed{
    return _count;
}

@end
