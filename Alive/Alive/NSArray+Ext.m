//
//  NSArray+Ext.m
//  day8
//
//  Created by qianfeng on 15-4-13.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "NSArray+Ext.h"

@implementation NSArray (Ext)

- (NSString *)descriptionWithLocale:(id)locale
{
    NSMutableString * str = [[NSMutableString alloc] init];
    [str appendString:@"(\n"];
    for (id obj in self) {
        [str appendString:[NSString stringWithFormat:@"\t%@,\n",obj]];
    }
    [str appendString:@")"];
    return str;
}

@end
