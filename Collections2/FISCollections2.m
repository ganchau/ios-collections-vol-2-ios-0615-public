//
//  FISCollections2.m
//  Collections2
//
//  Created by Chris Gonzales on 5/31/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCollections2.h"

@implementation FISCollections2

//define methods here
- (BOOL)beginsWithC:(NSArray *)tools
{
    for (NSString *tool in tools) {
        if (![tool hasPrefix:@"c"]) {
            return NO;
        }
    }
    return YES;
}

- (NSArray *)containA:(NSArray *)elements
{
    NSMutableArray *elementsThatContainA = [@[] mutableCopy];
    
    for (NSString *element in elements) {
        if ([element containsString:@"a"]) {
            [elementsThatContainA addObject:element];
        }
    }
    return [elementsThatContainA copy];
}

- (NSString *)firstWa:(NSArray *)elements
{
    for (NSString *element in elements) {
        if ([element containsString:@"wa"]) {
            return element;
        }
    }
    return nil;
}

- (NSArray *)removeNonStrings:(NSArray *)elements
{
    NSMutableArray *arrayOfStrings = [@[] mutableCopy];
    
    for (NSString *element in elements) {
        if ([element isKindOfClass:[NSString class]]) {
            [arrayOfStrings addObject:element];
        }
    }
    return arrayOfStrings;
}

- (NSArray *)countElements:(NSArray *)elements
{
    NSMutableArray *arrayOfElementWithCount = [@[] mutableCopy];
    NSMutableArray *arrayOfElementAlreadyCompared = [@[] mutableCopy];
    
    for (NSInteger i = 0; i < elements.count; i++) {
        
        if (![arrayOfElementAlreadyCompared containsObject:elements[i]]) {
            [arrayOfElementAlreadyCompared addObject:elements[i]];
            NSMutableDictionary *elementWithCount = [@{} mutableCopy];
            NSDictionary *elementToCompare = elements[i];
            NSUInteger count = 1;
            
            for (NSInteger j = i+1; j < elements.count; j++) {
                if ([elementToCompare isEqualToDictionary:elements[j]]) {
                    count++;
                }
            }
            
            if (![arrayOfElementWithCount containsObject:elementWithCount]) {
                elementWithCount = [elementToCompare mutableCopy];
                elementWithCount[@"count"] = @(count);
                [arrayOfElementWithCount addObject:elementWithCount];
            }
        }
    }
    
    return arrayOfElementWithCount;
}

- (NSArray *)mergeDataWithKeys:(NSArray *)keys AndData:(NSArray *)datas
{
//    keys = @[
//             @{@"first_name":  @"blake"},
//             @{@"first_name":  @"ashley"}
//             ];
//    data = @[
//             @{@"blake": @{@"awesomeness": @10,
//                           @"height": @74,
//                           @"last_name": @"johnson"},
//               @"ashley": @{@"awesomeness": @9,
//                            @"height": @60,
//                            @"last_name": @"dubs"}}
//             ];
//    mergedData = @[
//                   @{@"first_name": @"blake",
//                     @"awesomeness": @10,
//                     @"height": @74,
//                     @"last_name": @"johnson"},
//                   @{@"first_name": @"ashley",
//                     @"awesomeness": @9,
//                     @"height": @60,
//                     @"last_name": @"dubs"}
//                   ];
    
    NSMutableArray *mergedData = [@[] mutableCopy];
    NSMutableArray *keysOfFirstNames = [@[] mutableCopy];
    
    for (NSDictionary *dictionaryOfKeys in keys) {
        NSString *key = dictionaryOfKeys[@"first_name"];
        [keysOfFirstNames addObject:key];
    }
    
    for (NSInteger i=0; i<keysOfFirstNames.count; i++) {
        for (NSDictionary *data in datas) {
            NSString *firstName = keysOfFirstNames[i];
            NSMutableDictionary *mergedDictionary = [data[firstName] mutableCopy];   // convert to mutable dictionary
            mergedDictionary[@"first_name"] = firstName;
            [mergedData addObject:[mergedDictionary copy]];   // convert back to immutable dictionary
        }
    }

    return mergedData;
}

- (NSArray *)findCool:(NSArray *)dictionaries
{
    NSMutableArray *arrayofCoolDictionaries = [@[] mutableCopy];
    
    for (NSDictionary *dictionary in dictionaries) {
        NSArray *allValuesOfDictionary = [dictionary allValues];
        if ([allValuesOfDictionary containsObject:@"cool"]) {
            [arrayofCoolDictionaries addObject:dictionary];
        }
    }
    return [arrayofCoolDictionaries copy];
}

- (NSDictionary *)organizeSchools:(NSDictionary *)schools
{
//    schools = @{
//                @"flatiron school bk": @{@"location": @"NYC"},
//                @"flatiron school": @{@"location": @"NYC"},
//                @"dev boot camp": @{@"location": @"SF"},
//                @"dev boot camp chicago": @{@"location": @"Chicago"},
//                @"general assembly": @{@"location": @"NYC"},
//                @"Hack Reactor": @{@"location": @"SF"}
//                };
//    
//    organizedSchools = @{@"NYC":@[@"flatiron school bk",@"flatiron school",@"general assembly"],
//                         @"SF":@[@"dev boot camp",@"Hack Reactor"],
//                         @"Chicago":@[@"dev boot camp chicago"]};
    
    NSMutableDictionary *organizedSchools = [@{} mutableCopy];
    NSMutableArray *cities = [@[] mutableCopy];
    
    for (NSDictionary *location in [schools allValues]) {
        NSString *city = location[@"location"];
        if (![cities containsObject:city]) {
            [cities addObject:city];
        }
    }
    
    for (NSString *city in cities) {
        
        NSMutableArray *schoolsInSameCity = [@[] mutableCopy];
        for (NSString *school in schools) {
            if ([schools[school][@"location"] isEqualToString:city]) {
                [schoolsInSameCity addObject:school];
            }
        }
        organizedSchools[city] = schoolsInSameCity;
    }
    
    return organizedSchools;
}

@end
