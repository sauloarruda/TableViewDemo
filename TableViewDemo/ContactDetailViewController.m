//
//  ContactDetailViewController.m
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ContactDetailViewController.h"


@interface ContactDetailViewController ()
- (IBAction)doneButtonTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation ContactDetailViewController
@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize contact = _contact;

- (void)viewDidLoad
{
    if (self.contact) {
        [self.firstNameTextField setText:self.contact.firstName];
        [self.lastNameTextField setText:self.contact.lastName];
    }
}


- (IBAction)doneButtonTapped:(id)sender 
{
    if (self.contact) {
        [self.contact setFirstName:self.firstNameTextField.text];
        [self.contact setLastName:self.lastNameTextField.text];
    } else {
        [Contact addContactWithFirstName:self.firstNameTextField.text lastName:self.lastNameTextField.text];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setFirstNameTextField:nil];
    [self setLastNameTextField:nil];
    [super viewDidUnload];
}
@end
