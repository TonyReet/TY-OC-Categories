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

@property (nonatomic, copy, nullable) NSObjectRecursiveModifyBlock modifyBlock;

@end

@implementation NSObject (Recursive)

- (void)setModifyBlock:(id (^)(id))modifyBlock{
    objc_setAssociatedObject(self, @selector(modifyBlock), modifyBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id (^)(id))modifyBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSDictionary *)recursiveWithDict:(NSDictionary *)dict modifyBlock:(NSObjectRecursiveModifyBlock )modifyBlock{
    self.modifyBlock = modifyBlock;
    
    NSMutableDictionary *mutableDict = [self mutableDicDeepCopy:dict];
    NSDictionary *changeDict = [self processParsedObject:mutableDict];
    
    self.modifyBlock = nil;
    
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
    else{
        if (self.modifyBlock){
            return self.modifyBlock(object);
        }else{
            NSLog(@"object:%@",[object description]);
        }
    }
    
    return object;
}

@end
