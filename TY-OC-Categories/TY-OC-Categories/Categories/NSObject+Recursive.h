//
//  NSObject+Recursive.h
//  StarKids
//
//  Created by tonyreet on 2020/11/19.
//  Copyright © 2020 StarKids. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Recursive)

/// 递归添加特定字符串
/// @param addString 字符串
/// @param dict 需要添加的dict
- (NSDictionary *)recursiveAddString:(NSString *)addString dict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
