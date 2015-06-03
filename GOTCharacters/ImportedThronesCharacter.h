//
//  ImportedThronesCharacter.h
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImportedThronesCharacter : NSObject

@property NSString *name;
@property NSString *actor;
@property NSString *gender;
@property NSString *alias;
@property NSString *allegiance;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
 + (void)retrieveCharactersWithCompletion:(void(^)(NSArray*))complete;

@end
