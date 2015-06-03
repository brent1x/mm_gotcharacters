//
//  ImportedThronesCharacter.m
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "ImportedThronesCharacter.h"

@implementation ImportedThronesCharacter

- (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.name = [dictionary objectForKey:@"character"];
        self.actor = [dictionary objectForKey:@"actor"];
    }
    return self;
}

+ (void)retrieveCharactersWithCompletion:(void (^)(NSArray *))complete{
    NSURL *url = [NSURL URLWithString:@"https://dl.dropboxusercontent.com/u/1673233/got.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSMutableArray *characters = [NSMutableArray arrayWithCapacity:results.count];
        for (NSDictionary *dict in results) {
            [characters addObject:[[ImportedThronesCharacter alloc]initWithDictionary:dict]];
        }
        complete(characters);
    }];
}

@end
