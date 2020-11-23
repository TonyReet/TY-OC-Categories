//
//  NSObject+Recursive.h
//  StarKids
//
//  Created by tonyreet on 2020/11/19.
//  Copyright © 2020 StarKids. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef _Nonnull id(^NSObjectRecursiveModifyBlock)(_Nonnull id object);

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Recursive)

/// 修改字符串
/// @param dict 需要修改的dict
/// @param modifyBlock 需要修改的操作
+ (NSDictionary *)recursiveWithDict:(NSDictionary *)dict modifyBlock:(NSObjectRecursiveModifyBlock )modifyBlock;

@end

NS_ASSUME_NONNULL_END
