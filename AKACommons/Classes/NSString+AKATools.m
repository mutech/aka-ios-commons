//
//  NSString+AKATools.m
//  AKACommons
//
//  Created by Michael Utech on 27.03.15.
//  Copyright (c) 2015 Michael Utech & AKA Sarl. All rights reserved.
//

#import "NSString+AKATools.h"

@implementation NSString (AKATools)

- (NSUInteger)aka_occurencesOfCharacters:(NSCharacterSet*)characters
{
    NSUInteger result = 0;
    for (NSUInteger i=0; i < self.length; ++i)
    {
        unichar c = [self characterAtIndex:i];
        if ([characters characterIsMember:c])
        {
            ++result;
        }
    }
    return result;
}

- (NSUInteger)aka_occurrencesOfCharactersInString:(NSString*)string
{
    NSCharacterSet* cs = [NSCharacterSet characterSetWithCharactersInString:string];
    return [self aka_occurencesOfCharacters:cs];
}


- (NSString *)aka_stringWithFirstCharacterUppercase
{
    NSString* result;
    switch (self.length)
    {
        case 0:
            result = self;
            break;
        case 1:
            result = [self uppercaseString];
            break;
        default:
            result = [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
            break;
    }
    return result;
}

@end
