//
//  ContactCell.m
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "ContactCell.h"

@interface ContactCell ()

@property (nonatomic, weak) IBOutlet UILabel* titleLabel;

@end

@implementation ContactCell

@synthesize titleLabel;

- (void)configureWithContact:(Contact *)contact
{
    [self.titleLabel setText:contact.fullName];
}

@end
