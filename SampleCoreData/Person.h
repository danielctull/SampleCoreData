//
//  Person.h
//  SampleCoreData
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Person : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * dateOfBirth;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * surname;
@property (nonatomic, retain) NSManagedObject * address;
@property (nonatomic, retain) NSSet* siblings;

- (void)addSiblingsObject:(Person *)value;

@end
