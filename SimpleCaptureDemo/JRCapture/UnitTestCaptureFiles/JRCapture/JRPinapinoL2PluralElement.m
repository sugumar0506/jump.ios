/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 Copyright (c) 2012, Janrain, Inc.

 All rights reserved.

 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation and/or
   other materials provided with the distribution.
 * Neither the name of the Janrain, Inc. nor the names of its
   contributors may be used to endorse or promote products derived from this
   software without specific prior written permission.


 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif

#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


#import "JRPinapinoL2PluralElement.h"

@interface NSArray (PinapinoL3PluralToFromDictionary)
- (NSArray*)arrayOfPinapinoL3PluralElementsFromPinapinoL3PluralDictionariesWithPath:(NSString*)capturePath;
- (NSArray*)arrayOfPinapinoL3PluralDictionariesFromPinapinoL3PluralElements;
- (NSArray*)arrayOfPinapinoL3PluralReplaceDictionariesFromPinapinoL3PluralElements;
@end

@implementation NSArray (PinapinoL3PluralToFromDictionary)
- (NSArray*)arrayOfPinapinoL3PluralElementsFromPinapinoL3PluralDictionariesWithPath:(NSString*)capturePath
{
    NSMutableArray *filteredPinapinoL3PluralArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *dictionary in self)
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [filteredPinapinoL3PluralArray addObject:[JRPinapinoL3PluralElement pinapinoL3PluralElementFromDictionary:(NSDictionary*)dictionary withPath:capturePath]];

    return filteredPinapinoL3PluralArray;
}

- (NSArray*)arrayOfPinapinoL3PluralDictionariesFromPinapinoL3PluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapinoL3PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapinoL3PluralElement*)object toDictionary]];

    return filteredDictionaryArray;
}

- (NSArray*)arrayOfPinapinoL3PluralReplaceDictionariesFromPinapinoL3PluralElements
{
    NSMutableArray *filteredDictionaryArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (NSObject *object in self)
        if ([object isKindOfClass:[JRPinapinoL3PluralElement class]])
            [filteredDictionaryArray addObject:[(JRPinapinoL3PluralElement*)object toReplaceDictionaryIncludingArrays:YES]];

    return filteredDictionaryArray;
}
@end

@implementation NSArray (PinapinoL2PluralElement_ArrayComparison)

- (BOOL)isEqualToOtherPinapinoL3PluralArray:(NSArray *)otherArray
{
    if ([self count] != [otherArray count]) return NO;

    for (NSUInteger i = 0; i < [self count]; i++)
        if (![((JRPinapinoL3PluralElement *)[self objectAtIndex:i]) isEqualToPinapinoL3PluralElement:[otherArray objectAtIndex:i]])
            return NO;

    return YES;
}
@end

@interface JRPinapinoL2PluralElement ()
@property BOOL canBeUpdatedOrReplaced;
@end

@implementation JRPinapinoL2PluralElement
{
    NSString *_string1;
    NSString *_string2;
    NSArray *_pinapinoL3Plural;
}
@dynamic string1;
@dynamic string2;
@dynamic pinapinoL3Plural;
@synthesize canBeUpdatedOrReplaced;

- (NSString *)string1
{
    return _string1;
}

- (void)setString1:(NSString *)newString1
{
    [self.dirtyPropertySet addObject:@"string1"];

    [_string1 autorelease];
    _string1 = [newString1 copy];
}

- (NSString *)string2
{
    return _string2;
}

- (void)setString2:(NSString *)newString2
{
    [self.dirtyPropertySet addObject:@"string2"];

    [_string2 autorelease];
    _string2 = [newString2 copy];
}

- (NSArray *)pinapinoL3Plural
{
    return _pinapinoL3Plural;
}

- (void)setPinapinoL3Plural:(NSArray *)newPinapinoL3Plural
{
    [self.dirtyArraySet addObject:@"pinapinoL3Plural"];

    [_pinapinoL3Plural autorelease];
    _pinapinoL3Plural = [newPinapinoL3Plural copy];
}

- (id)init
{
    if ((self = [super init]))
    {
        self.captureObjectPath      = @"";
        self.canBeUpdatedOrReplaced = NO;
    }
    return self;
}

+ (id)pinapinoL2PluralElement
{
    return [[[JRPinapinoL2PluralElement alloc] init] autorelease];
}

- (id)copyWithZone:(NSZone*)zone
{
    JRPinapinoL2PluralElement *pinapinoL2PluralElementCopy = (JRPinapinoL2PluralElement *)[super copy];

    pinapinoL2PluralElementCopy.string1 = self.string1;
    pinapinoL2PluralElementCopy.string2 = self.string2;
    pinapinoL2PluralElementCopy.pinapinoL3Plural = self.pinapinoL3Plural;

    return pinapinoL2PluralElementCopy;
}

- (NSDictionary*)toDictionary
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null])
             forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null])
             forKey:@"string2"];
    [dict setObject:(self.pinapinoL3Plural ? [self.pinapinoL3Plural arrayOfPinapinoL3PluralDictionariesFromPinapinoL3PluralElements] : [NSNull null])
             forKey:@"pinapinoL3Plural"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

+ (id)pinapinoL2PluralElementFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    if (!dictionary)
        return nil;

    JRPinapinoL2PluralElement *pinapinoL2PluralElement = [JRPinapinoL2PluralElement pinapinoL2PluralElement];

    pinapinoL2PluralElement.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"pinapinoL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];
// TODO: Is this safe to assume?
    pinapinoL2PluralElement.canBeUpdatedOrReplaced = YES;

    pinapinoL2PluralElement.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    pinapinoL2PluralElement.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    pinapinoL2PluralElement.pinapinoL3Plural =
        [dictionary objectForKey:@"pinapinoL3Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapinoL3Plural"] arrayOfPinapinoL3PluralElementsFromPinapinoL3PluralDictionariesWithPath:pinapinoL2PluralElement.captureObjectPath] : nil;

    [pinapinoL2PluralElement.dirtyPropertySet removeAllObjects];
    [pinapinoL2PluralElement.dirtyArraySet removeAllObjects];
    
    return pinapinoL2PluralElement;
}

- (void)updateFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"pinapinoL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    if ([dictionary objectForKey:@"string1"])
        self.string1 = [dictionary objectForKey:@"string1"] != [NSNull null] ? 
            [dictionary objectForKey:@"string1"] : nil;

    if ([dictionary objectForKey:@"string2"])
        self.string2 = [dictionary objectForKey:@"string2"] != [NSNull null] ? 
            [dictionary objectForKey:@"string2"] : nil;

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
    [self.dirtyArraySet setSet:dirtyArraySetCopy];
}

- (void)replaceFromDictionary:(NSDictionary*)dictionary withPath:(NSString *)capturePath
{
    DLog(@"%@ %@", capturePath, [dictionary description]);

    NSSet *dirtyPropertySetCopy = [[self.dirtyPropertySet copy] autorelease];
    NSSet *dirtyArraySetCopy    = [[self.dirtyArraySet copy] autorelease];

    self.canBeUpdatedOrReplaced = YES;
    self.captureObjectPath = [NSString stringWithFormat:@"%@/%@#%d", capturePath, @"pinapinoL2Plural", [(NSNumber*)[dictionary objectForKey:@"id"] integerValue]];

    self.string1 =
        [dictionary objectForKey:@"string1"] != [NSNull null] ? 
        [dictionary objectForKey:@"string1"] : nil;

    self.string2 =
        [dictionary objectForKey:@"string2"] != [NSNull null] ? 
        [dictionary objectForKey:@"string2"] : nil;

    self.pinapinoL3Plural =
        [dictionary objectForKey:@"pinapinoL3Plural"] != [NSNull null] ? 
        [(NSArray*)[dictionary objectForKey:@"pinapinoL3Plural"] arrayOfPinapinoL3PluralElementsFromPinapinoL3PluralDictionariesWithPath:self.captureObjectPath] : nil;

    [self.dirtyPropertySet setSet:dirtyPropertySetCopy];
    [self.dirtyArraySet setSet:dirtyArraySetCopy];
}

- (NSDictionary *)toUpdateDictionary
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    if ([self.dirtyPropertySet containsObject:@"string1"])
        [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];

    if ([self.dirtyPropertySet containsObject:@"string2"])
        [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    return dict;
}

- (NSDictionary *)toReplaceDictionaryIncludingArrays:(BOOL)includingArrays
{
    NSMutableDictionary *dict =
         [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:(self.string1 ? self.string1 : [NSNull null]) forKey:@"string1"];
    [dict setObject:(self.string2 ? self.string2 : [NSNull null]) forKey:@"string2"];

    if (includingArrays)
        [dict setObject:(self.pinapinoL3Plural ?
                          [self.pinapinoL3Plural arrayOfPinapinoL3PluralReplaceDictionariesFromPinapinoL3PluralElements] :
                          [NSArray array])
                 forKey:@"pinapinoL3Plural"];

    return dict;
}

- (void)replacePinapinoL3PluralArrayOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate withContext:(NSObject *)context
{
    [self replaceArrayOnCapture:self.pinapinoL3Plural named:@"pinapinoL3Plural"
                    forDelegate:delegate withContext:context];
}

- (BOOL)needsUpdate
{
    if ([self.dirtyPropertySet count])
         return YES;

    return NO;
}

- (BOOL)isEqualToPinapinoL2PluralElement:(JRPinapinoL2PluralElement *)otherPinapinoL2PluralElement
{
    if (!self.string1 && !otherPinapinoL2PluralElement.string1) /* Keep going... */;
    else if ((self.string1 == nil) ^ (otherPinapinoL2PluralElement.string1 == nil)) return NO; // xor
    else if (![self.string1 isEqualToString:otherPinapinoL2PluralElement.string1]) return NO;

    if (!self.string2 && !otherPinapinoL2PluralElement.string2) /* Keep going... */;
    else if ((self.string2 == nil) ^ (otherPinapinoL2PluralElement.string2 == nil)) return NO; // xor
    else if (![self.string2 isEqualToString:otherPinapinoL2PluralElement.string2]) return NO;

    if (!self.pinapinoL3Plural && !otherPinapinoL2PluralElement.pinapinoL3Plural) /* Keep going... */;
    else if (!self.pinapinoL3Plural && ![otherPinapinoL2PluralElement.pinapinoL3Plural count]) /* Keep going... */;
    else if (!otherPinapinoL2PluralElement.pinapinoL3Plural && ![self.pinapinoL3Plural count]) /* Keep going... */;
    else if (![self.pinapinoL3Plural isEqualToOtherPinapinoL3PluralArray:otherPinapinoL2PluralElement.pinapinoL3Plural]) return NO;

    return YES;
}

- (NSDictionary*)objectProperties
{
    NSMutableDictionary *dict = 
        [NSMutableDictionary dictionaryWithCapacity:10];

    [dict setObject:@"NSString" forKey:@"string1"];
    [dict setObject:@"NSString" forKey:@"string2"];
    [dict setObject:@"NSArray" forKey:@"pinapinoL3Plural"];

    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)dealloc
{
    [_string1 release];
    [_string2 release];
    [_pinapinoL3Plural release];

    [super dealloc];
}
@end