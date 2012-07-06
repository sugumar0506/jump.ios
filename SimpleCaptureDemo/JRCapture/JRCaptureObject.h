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

#import <Foundation/Foundation.h>

@class JRCaptureObject;

/**
 * @brief
 * Protocol adopted by an object ...
 **/
@protocol JRCaptureObjectDelegate <NSObject>
@optional

/**
 * Sent if ...
 *
 * @param object
 *   object
 *
 * @param context
 *   context
 **/
- (void)updateDidSucceedForObject:(JRCaptureObject *)object context:(NSObject *)context;

/**
 * Sent if ...
 *
 * @param object
 *   object
 *
 * @param context
 *   context
 **/
- (void)updateDidFailForObject:(JRCaptureObject *)object withError:(NSError *)error context:(NSObject *)context;

/**
 * Sent if ...
 *
 * @param object
 *   object
 *
 * @param context
 *   context
 **/
- (void)replaceArrayDidSucceedForObject:(JRCaptureObject *)object newArray:(NSArray *)replacedArray
                                  named:(NSString *)arrayName context:(NSObject *)context;

/**
 * Sent if ...
 *
 * @param object
 *   object
 *
 * @param context
 *   context
 **/
- (void)replaceArrayDidFailForObject:(JRCaptureObject *)object arrayNamed:(NSString *)arrayName
                           withError:(NSError *)error context:(NSObject *)context;
@end

/**
 * @brief
 * Protocol adopted by an object ...
 **/
@interface JRCaptureObject : NSObject <NSCopying>
@property (readonly) BOOL canBeUpdatedOnCapture; /**< foo */

/**
 * bar
 **/
- (BOOL)needsUpdate;

/**
 * Sent if ...
 *
 * @param delegate
 *   delegate
 *
 * @param context
 *   context
 **/
- (void)updateOnCaptureForDelegate:(id<JRCaptureObjectDelegate>)delegate context:(NSObject *)context;
@end
