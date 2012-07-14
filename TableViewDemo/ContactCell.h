//
//  ContactCell.h
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"

@interface ContactCell : UITableViewCell

- (void)configureWithContact:(Contact*)contact;

@end
