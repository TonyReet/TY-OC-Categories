//
//  DeepCopyViewController.m
//  TY-OC-Categories
//
//  Created by tonyreet on 2020/11/23.
//

#import "DeepCopyViewController.h"
#import "NSObject+DeepCopy.h"

@interface DeepCopyViewController ()

@end

@implementation DeepCopyViewController

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

    // 递归拷贝
    NSDictionary *newDataDict = [NSObject mutableDicDeepCopy:dataDict.mutableCopy];
    
    
    NSLog(@"oldData:%p,data:%@,newDataDict:%p,newData:%@",dataDict,dataDict,newDataDict,newDataDict);
}



@end
