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
	
	NSManagedObjectModel *managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
	
	
    NSString *path = [[[NSProcessInfo processInfo] arguments] objectAtIndex:0];
    path = [path stringByDeletingPathExtension];
    NSURL *url = [NSURL fileURLWithPath:[path stringByAppendingPathExtension:@"sqlite"]];
	
	NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
	
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
											 configuration:nil
													   URL:url
												   options:nil 
													 error:NULL];
	
	NSManagedObjectContext *context = [[NSManagedObjectContext alloc] init];
	
    [context setPersistentStoreCoordinator:persistentStoreCoordinator];
	[persistentStoreCoordinator release];	
	
	
	

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
	
	NSLog(@"Saving to %@", url);

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

