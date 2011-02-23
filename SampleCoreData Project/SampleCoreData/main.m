//
//  main.m
//  SampleCoreData
//
//  Created by Daniel Tull on 23.02.2011.
//  Copyright 2011 Daniel Tull. All rights reserved.
//

NSManagedObjectModel *managedObjectModel();
NSManagedObjectContext *managedObjectContext();

#import "Person.h"
#import "Address.h"

int main (int argc, const char * argv[])
{

	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// Create the managed object context
	NSManagedObjectContext *context = managedObjectContext();
	

	Person *dan = [NSEntityDescription insertNewObjectForEntityForName:@"Person" 
												inManagedObjectContext:context];
	dan.firstName = @"Daniel";
	dan.surname = @"Tull";
	
	Person *martin = [NSEntityDescription insertNewObjectForEntityForName:@"Person" 
												   inManagedObjectContext:context];
	martin.firstName = @"Martin";
	martin.surname = @"Tull";
	[dan addSiblingsObject:martin];
	
	Address *address = [NSEntityDescription insertNewObjectForEntityForName:@"Address" 
														inManagedObjectContext:context];
	address.street = @"45 Baker Street";
	address.town = @"Guildford";
	address.postcode = @"GU1 1AA";
	address.country = @"UK";
	
	dan.address = address;
	martin.address = address;
	

	// Save the managed object context
	NSError *error = nil;    
	if (![context save:&error]) {
		NSLog(@"Error while saving %@", ([error localizedDescription] != nil) ? [error localizedDescription] : @"Unknown Error");
		[pool drain]; 
		exit(1);
	}
	[pool drain];
    return 0;
}

NSManagedObjectModel *managedObjectModel() {
    
    static NSManagedObjectModel *model = nil;
    
    if (model != nil) {
        return model;
    }
    
    NSString *path = [[[NSProcessInfo processInfo] arguments] objectAtIndex:0];
    path = [path stringByDeletingPathExtension];
    NSURL *modelURL = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"mom"]];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    return model;
}

NSManagedObjectContext *managedObjectContext() {

    static NSManagedObjectContext *context = nil;
    if (context != nil) {
        return context;
    }

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];        
    context = [[NSManagedObjectContext alloc] init];
    
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: managedObjectModel()];
    [context setPersistentStoreCoordinator: coordinator];
    
    NSString *STORE_TYPE = NSSQLiteStoreType;
    
    NSString *path = [[[NSProcessInfo processInfo] arguments] objectAtIndex:0];
    path = [path stringByDeletingPathExtension];
    NSURL *url = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"sqlite"]];
    
    NSError *error;
    NSPersistentStore *newStore = [coordinator addPersistentStoreWithType:STORE_TYPE configuration:nil URL:url options:nil error:&error];
    
    if (newStore == nil) {
        NSLog(@"Store Configuration Failure %@",
              ([error localizedDescription] != nil) ?
              [error localizedDescription] : @"Unknown Error");
    }
    [pool drain];
    return context;
}

