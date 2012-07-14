//
//  ContactViewController.m
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactDetailViewController.h"
#import "ContactCell.h"

@interface ContactViewController () {
    BOOL _editing;
}

@property (nonatomic, strong) NSArray* contactsArray;
- (IBAction)editButtonTapped:(id)sender;

@end

@implementation ContactViewController

@synthesize contactsArray = _contactsArray;

- (void)viewDidAppear:(BOOL)animated
{
    [Contact allContactsWithDelegate:self];
    [self.tableView reloadData];
}

#pragma mark - ContactsLoadDelegate methods

- (void)contactsLoadDidFinish:(NSArray *)contactsArray
{
    self.contactsArray = contactsArray;
}

- (void)contactsLoadDidFailWithError:(NSError *)error
{
    NSLog(@"Error loading contacts: %@", [error localizedDescription]);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.contactsArray count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"ContactCell";
    ContactCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Configurar célula
    Contact* contact = [self.contactsArray objectAtIndex:indexPath.row];
    [cell configureWithContact:contact];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact* contact = [self.contactsArray objectAtIndex:indexPath.row];
    [Contact deleteContact:contact];
    [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Contact* contact = [self.contactsArray objectAtIndex:indexPath.row];
    ContactDetailViewController* controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactDetail"];
    [controller setContact:contact];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - Actions

- (IBAction)editButtonTapped:(id)sender {
    _editing = !_editing;
    [self.tableView setEditing:_editing];
}



@end
