//
//  ThronesCharacter.h
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ThronesCharacter : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *actor;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, retain) NSString *alias;
@property (nonatomic, retain) NSString *allegiance;

@end
