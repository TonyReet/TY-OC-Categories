//
//  RecursiveModifyDataViewController.m
//  TY-OC-Categories
//
//  Created by tonyreet on 2020/11/23.
//

#import "RecursiveModifyDataViewController.h"
#import "NSObject+Recursive.h"

@interface RecursiveModifyDataViewController ()

@end

@implementation RecursiveModifyDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDictionary *dataDict =
    @{@"test":@[
                @{@"word":@"ab",@"wordAudioUrl":@"20201123104801.mp3"},
                @{@"word":@"ac",@"wordAudioUrl":@"20201123104802.mp3"}
               ],
      @"test1":@[
                  @{@"word":@"ad",@"wordAudioUrl":@"20201123104801.mp3"},
                  @{@"word":@"ae",@"wordAudioUrl":@"20201123104802.mp3"}
                 ],
    };

    NSString *directoryPath = @"var/test/directoryPath";
    // 递归拷贝
    NSDictionary *newDataDict = [NSObject recursiveWithDict:dataDict modifyBlock:^id _Nonnull(id  _Nonnull object) {
        if (![object isKindOfClass:[NSString class]])return object;

        // 拼接路径
        NSString *objectString = (NSString *)object;
        if ([objectString containsString:@".mp3"] ||
            [objectString containsString:@".png"] ||
            [objectString containsString:@".mp4"] ||
            [objectString containsString:@".jpg"] ||
            [objectString containsString:@".zip"]){

            object = [directoryPath stringByAppendingString:objectString];
        }

        return object;
    }];
    
    
    NSLog(@"oldData:%p,data:%@,newDataDict:%p,newData:%@",dataDict,dataDict,newDataDict,newDataDict);
    
}

@end
