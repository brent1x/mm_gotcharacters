//
//  ViewController.m
//  GameOfThronesCharactersChallenge
//
//  Created by Brent Dady on 6/2/15.
//  Copyright (c) 2015 Brent Dady. All rights reserved.
//

#import "RootViewController.h"
#import "ImportedThronesCharacter.h"
#import "ThronesCharacter.h"
#import "AppDelegate.h"
#import "AddCharacterViewController.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic)  NSArray *characters;
@property NSManagedObjectContext *moc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.moc = delegate.managedObjectContext;

    [self loadCharacters];
    [self populateWithThronesCharactersIfEmpty];
}

- (void)loadCharacters {
    NSFetchRequest *rq = [[NSFetchRequest alloc] initWithEntityName:@"ThronesCharacter"];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(localizedCaseInsensitiveCompare:)];
    rq.sortDescriptors = [NSArray arrayWithObject:sort];
    self.characters = [self.moc executeFetchRequest:rq error:nil];
    [self.tableView reloadData];
}

- (void)populateWithThronesCharactersIfEmpty {
    if (self.characters.count == 0) {
        [ImportedThronesCharacter retrieveCharactersWithCompletion:^(NSArray *importedCharacters) {
            for (ImportedThronesCharacter *importedCharacter in importedCharacters) {
                ThronesCharacter *character = [NSEntityDescription insertNewObjectForEntityForName:@"ThronesCharacter" inManagedObjectContext:self.moc];
                character.name = importedCharacter.name;
                character.actor = importedCharacter.actor;
            }
            [self.moc save:nil];
            [self loadCharacters];
            [self.tableView reloadData];
        }];
    }
}

- (void)setCharacters:(NSArray *)characters {
    _characters = characters;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.characters.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    ImportedThronesCharacter *character = [self.characters objectAtIndex:indexPath.row];

    cell.textLabel.text = character.name;
    cell.detailTextLabel.text = character.gender;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {

    if ([segue.identifier isEqualToString:@"SegueToCharacterDetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        RootViewController *destinationVC = segue.destinationViewController;
        destinationVC.character = [self.characters objectAtIndex:indexPath.row];
    }
    else {
    }
}


- (IBAction)unwindToThisViewController:(UIStoryboardSegue *)unwindSegue {
    ThronesCharacter *character = [NSEntityDescription insertNewObjectForEntityForName:@"ThronesCharacter" inManagedObjectContext:self.moc];
    character.name = self.name;
    character.actor = self.actor;
    character.gender = self.gender;
    character.alias = self.alias;
    character.allegiance = self.allegiance;

    [self.moc save:nil];
    [self loadCharacters];

    [self.tableView reloadData];
}

@end
