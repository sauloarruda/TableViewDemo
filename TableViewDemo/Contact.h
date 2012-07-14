//
//  Contact.h
//  TableViewDemo
//
//  Created by Saulo Arruda Coelho on 7/14/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ContactsLoadDelegate <NSObject>

- (void)contactsLoadDidFinish:(NSArray*)contactsArray;
- (void)contactsLoadDidFailWithError:(NSError*)error;

@end

@interface Contact : NSObject

@property (nonatomic, strong) NSString* firstName;
@property (nonatomic, strong) NSString* lastName;
@property (nonatomic, readonly) NSString* fullName;

+ (void)allContactsWithDelegate:(id<ContactsLoadDelegate>)delegate;
+ (void)addContactWithFirstName:(NSString*)firstName lastName:(NSString*)lastName;
+ (void)deleteContact:(Contact*)contact;

@end
