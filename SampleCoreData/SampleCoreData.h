//
//  SampleCoreData.h
//  SampleCoreData
//
//  Created by Daniel Tull on 18.08.2012.
//  Copyright (c) 2012 Daniel Tull. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Address.h"
#import "Person.h"

@interface SampleCoreData : NSObject

+ (NSBundle *)bundle;
+ (NSURL *)modelURL;
+ (NSURL *)storeURL;
+ (NSString *)storeType;

@end
