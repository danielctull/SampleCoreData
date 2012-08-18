//
//  Address.m
//  SampleCoreData
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "Address.h"
#import "Person.h"


@implementation Address
@dynamic country;
@dynamic street;
@dynamic town;
@dynamic postcode;
@dynamic people;

- (void)addPeopleObject:(Person *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"people" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"people"] addObject:value];
    [self didChangeValueForKey:@"people" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
}

- (void)removePeopleObject:(Person *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"people" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"people"] removeObject:value];
    [self didChangeValueForKey:@"people" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
}

- (void)addPeople:(NSSet *)value {    
    [self willChangeValueForKey:@"people" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"people"] unionSet:value];
    [self didChangeValueForKey:@"people" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removePeople:(NSSet *)value {
    [self willChangeValueForKey:@"people" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"people"] minusSet:value];
    [self didChangeValueForKey:@"people" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
