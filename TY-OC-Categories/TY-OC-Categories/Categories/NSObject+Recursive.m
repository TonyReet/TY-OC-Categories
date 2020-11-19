//
//  NSObject+Recursive.m
//  StarKids
//
//  Created by tonyreet on 2020/11/19.
//  Copyright © 2020 StarKids. All rights reserved.
//

#import "NSObject+Recursive.h"
#import "NSObject+DeepCopy.h"
#import <objc/runtime.h>

@interface NSObject ()

// 添加的字符串前缀
@property (nonatomic, copy, nullable) NSString *addPrefixString;

@end

@implementation NSObject (Recursive)

- (void)setAddPrefixString:(NSString *)addPrefixString{
    objc_setAssociatedObject(self, @selector(addPrefixString), addPrefixString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)addPrefixString{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSDictionary *)recursiveAddString:(NSString *)addString dict:(NSDictionary *)dict{
    self.addPrefixString = addString;
    
    NSMutableDictionary *mutableDict = [self mutableDicDeepCopy:dict];
    NSDictionary *changeDict = [self processParsedObject:mutableDict];
    
    self.addPrefixString = nil;
    
    return changeDict;
}



- (id )processParsedObject:(id)object
{
    return [self processParsedObject:object depth:0 parent:nil];
}

- (id )processParsedObject:(id)object depth:(int)depth parent:(id)parent
{
    if ([object isKindOfClass:[NSDictionary class]])
    {
        for (NSString* key in [object allKeys])
        {
            id child = [object objectForKey:key];
            child = [self processParsedObject:child depth:(depth + 1) parent:object];
            [object setObject:child forKey:key];
        }
    }
    else if ([object isKindOfClass:[NSArray class]])
    {
        for (id child in object)
        {
            [self processParsedObject:child depth:(depth + 1) parent:object];
        }
    }
    else if ([object isKindOfClass:[NSString class]])
    {
        
        // 拼接路径
        NSString *objectString = (NSString *)object;
        if ([objectString containsString:@".mp3"] ||
            [objectString containsString:@".png"] ||
            [objectString containsString:@".mp4"] ||
            [objectString containsString:@".jpg"]){
            object = [self.addPrefixString stringByAppendingString:objectString];
        }
    }
    else
    {
        NSLog(@"object:%@",[object description]);
    }
    
    return object;
}

@end
