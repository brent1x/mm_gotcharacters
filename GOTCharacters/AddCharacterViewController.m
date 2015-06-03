//
//  AddCharacterViewController.m
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "AddCharacterViewController.h"

@interface AddCharacterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *characterName;
@property (weak, nonatomic) IBOutlet UITextField *actorName;
@property (weak, nonatomic) IBOutlet UITextField *actorGender;
@property (weak, nonatomic) IBOutlet UITextField *alias;
@property (weak, nonatomic) IBOutlet UITextField *allegiance;

@end

@implementation AddCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    RootViewController *destVC = segue.destinationViewController;
    destVC.name = self.characterName.text;
    destVC.actor = self.actorName.text;
    destVC.gender = self.actorGender.text;
    destVC.alias = self.alias.text;
    destVC.allegiance = self.allegiance.text;
}

@end
