//
//  CharacterDetailViewController.m
//  GOTCharacters
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "CharacterDetailViewController.h"

@interface CharacterDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *actorLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *aliasLabel;
@property (weak, nonatomic) IBOutlet UILabel *allegianceLabel;

@end

@implementation CharacterDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.character.name;
    self.actorLabel.text = self.character.actor;
    self.genderLabel.text = self.character.gender;
    self.aliasLabel.text = self.character.alias;
    self.allegianceLabel.text = self.character.allegiance;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
