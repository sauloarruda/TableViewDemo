//
//  Contact.m
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "Contact.h"

@interface Contact () 

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;

@end

static NSMutableArray* __contactsDb;

@implementation Contact

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;

- (id)initWithFirstName:(NSString*)firstName lastName:(NSString*)lastName
{
    self = [super init];
    if (self) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}

- (NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

+ (void)allContactsWithDelegate:(id<ContactsLoadDelegate>)delegate
{
    if (!__contactsDb) {
        __contactsDb = [NSMutableArray arrayWithObjects:
                        [[Contact alloc] initWithFirstName:@"Saulo" lastName:@"Arruda"],
                        [[Contact alloc] initWithFirstName:@"Douglas" lastName:@"Piva"],
                        [[Contact alloc] initWithFirstName:@"Lucas" lastName:@"Marquetti"],
                        [[Contact alloc] initWithFirstName:@"Frederick" lastName:@"Xabi"],
                        [[Contact alloc] initWithFirstName:@"Viktor" lastName:@"Dracula"],
                        [[Contact alloc] initWithFirstName:@"Marcio" lastName:@"Gordex"],
                        [[Contact alloc] initWithFirstName:@"Paulo" lastName:@"Yano"],
                        nil];
    }
    [delegate contactsLoadDidFinish:__contactsDb];
}

+ (void)addContactWithFirstName:(NSString *)firstName lastName:(NSString *)lastName
{
    Contact* contact = [[Contact alloc] initWithFirstName:firstName lastName:lastName];
    [__contactsDb addObject:contact];
}

+ (void)deleteContact:(Contact*)contact
{
    [__contactsDb removeObject:contact];
}

@end
