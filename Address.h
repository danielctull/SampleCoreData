//
//  Address.h
//  SampleCoreData
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Person;

@interface Address : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * town;
@property (nonatomic, retain) NSString * postcode;
@property (nonatomic, retain) NSSet* people;

@end
