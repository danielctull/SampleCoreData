//
//  Person.m
//  SampleCoreData
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "Person.h"
#import "Person.h"


@implementation Person
@dynamic dateOfBirth;
@dynamic firstName;
@dynamic surname;
@dynamic address;
@dynamic siblings;


- (void)addSiblingsObject:(Person *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"siblings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"siblings"] addObject:value];
    [self didChangeValueForKey:@"siblings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeSiblingsObject:(Person *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"siblings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"siblings"] removeObject:value];
    [self didChangeValueForKey:@"siblings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addSiblings:(NSSet *)value {    
    [self willChangeValueForKey:@"siblings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"siblings"] unionSet:value];
    [self didChangeValueForKey:@"siblings" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeSiblings:(NSSet *)value {
    [self willChangeValueForKey:@"siblings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"siblings"] minusSet:value];
    [self didChangeValueForKey:@"siblings" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
