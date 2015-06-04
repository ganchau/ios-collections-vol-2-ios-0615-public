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

- (NSArray *)mergeDataWithKeys:(NSArray *)keys AndData:(NSArray *)data
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
    
    
    for (NSDictionary *dictionaryOfKeys in keys) {
        NSString *key = dictionaryOfKeys[@"first_name"];
        for (NSDictionary *dictionaryOfDatas in data) {
            if (dictionaryOfDatas[key]) {
                dictionaryOfDatas[key][
            }
        }
    }
    return nil;
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
    return nil;
}

@end
