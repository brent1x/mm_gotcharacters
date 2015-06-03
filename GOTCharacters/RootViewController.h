//
//  ViewController.h
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ImportedThronesCharacter.h"

@interface RootViewController : UIViewController

@property ImportedThronesCharacter *character;

@property NSString *name;
@property NSString *actor;
@property NSString *gender;
@property NSString *alias;
@property NSString *allegiance;

@end

