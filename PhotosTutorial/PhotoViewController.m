//
//  PhotoViewController.m
//  PhotosTutorial
//
//  Created by Pavlo Kytsmey on 2/12/14.
//  Copyright (c) 2014 Pavlo Kytsmey. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoKeeper.h"
#include "PhotosTutorialSilgleton.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
#define menuSpace 60
    [self.view setBackgroundColor:[UIColor whiteColor]];
    PhotoKeeper* photo = [[PhotosTutorialSilgleton getPhotos] getTriggerPhoto];
    UIImage* image = [[UIImage alloc] initWithContentsOfFile:[photo getPath]];
    UIImageView* placeForImage = [[UIImageView alloc] initWithImage:image];
    placeForImage.frame = CGRectMake(self.view.bounds.origin.x,
                             (self.view.bounds.origin.y + menuSpace),
                             self.view.bounds.size.width,
                             (self.view.bounds.size.height - menuSpace));
    [self.view addSubview:placeForImage];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
