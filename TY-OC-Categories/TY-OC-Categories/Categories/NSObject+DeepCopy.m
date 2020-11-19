//
//  NSObject+DeepCopy.m
//  StarKids
//
//  Created by tonyreet on 2020/11/19.
//  Copyright © 2020 StarKids. All rights reserved.
//

#import "NSObject+DeepCopy.h"

@implementation NSObject (DeepCopy)

-(NSMutableDictionary *)mutableDicDeepCopy:(NSDictionary *)originDict{
    
    NSMutableDictionary *dict=[[NSMutableDictionary alloc] initWithCapacity:[originDict count]];
    
    NSArray *keys=[originDict allKeys];
    for(id key in keys)
    {
        //循环读取复制每一个元素
        id value=[originDict objectForKey:key];
        id copyValue;
        
        // 如果是字典，递归调用
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            copyValue=[self mutableDicDeepCopy:value];
            
            //如果是数组，数组数组深拷贝
        }else if([value isKindOfClass:[NSArray class]])
            
        {
            copyValue=[self mutableArrayDeeoCopy:value];
        }else{
            
            copyValue = value;
        }
        
        [dict setObject:copyValue forKey:key];
        
    }
    return dict;
    
}

-(NSMutableArray *)mutableArrayDeeoCopy:(NSArray *)originArr{
    
    NSMutableArray * array = [NSMutableArray array];
    [originArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        id objOject;
        
        if ([obj isKindOfClass:[NSDictionary class]]) {
            objOject = [obj mutableDicDeepCopy:obj];
            
        }else if ([obj isKindOfClass:[NSArray class]]){
            
            objOject = [obj mutableArrayDeeoCopy:obj];
            
        }else{
            
            objOject = obj;
        }
        [array addObject:objOject];
        
    }];
    
    return array;
}


@end
