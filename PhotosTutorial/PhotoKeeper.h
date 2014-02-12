//
//  PhotoKeeper.h
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/11/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoKeeper.h"

@interface PhotoKeeper : NSObject

- (id)initWithPathToFile:(NSString*)pathToPhoto;
- (NSString *) getPath;
- (void) fileViewed;
- (NSUInteger) getCountOfViewed;
- (NSDate*) getDate;
- (NSString*) getName;

@end
