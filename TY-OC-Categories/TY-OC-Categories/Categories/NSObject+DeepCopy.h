//
//  NSObject+DeepCopy.h
//  StarKids
//
//  Created by tonyreet on 2020/11/19.
//  Copyright © 2020 StarKids. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DeepCopy)

/// 深度拷贝dict
+(NSMutableDictionary *)mutableDicDeepCopy:(NSDictionary *)originDict;

/// 深度拷贝arry
+(NSMutableArray *)mutableArrayDeeoCopy:(NSArray *)originArr;

@end

NS_ASSUME_NONNULL_END
