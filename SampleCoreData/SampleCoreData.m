//
//  SampleCoreData.m
//  SampleCoreData
//
//  Created by Daniel Tull on 18.08.2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import "SampleCoreData.h"

@implementation SampleCoreData

+ (NSBundle *)bundle {
	
	NSDirectoryEnumerator *enumerator = [[NSFileManager new] enumeratorAtURL:[[NSBundle mainBundle] bundleURL]
												  includingPropertiesForKeys:nil
																	 options:NSDirectoryEnumerationSkipsHiddenFiles
																errorHandler:NULL];
	
	NSURL *URL = nil;
	while (URL = [enumerator nextObject]) {
		if ([[URL lastPathComponent] isEqualToString:@"SampleCoreData.bundle"])
			return [NSBundle bundleWithURL:URL];
	}
	
	return nil;
}

+ (NSURL *)modelURL {
	return [[self bundle] URLForResource:@"SampleCoreData" withExtension:@"momd"];
}

+ (NSURL *)storeURL {
	return [[self bundle] URLForResource:@"SampleCoreData" withExtension:@"sqlite"];
}

+ (NSString *)storeType {
	return NSSQLiteStoreType;
}

@end
