//
//  LiModel.h
//  tableViewTree
//
//  Created by 孙国立 on 2020/8/27.
//  Copyright © 2020 孙国立. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LiModel : NSObject
@property (nonatomic , strong) NSString *index;
@property (nonatomic , assign) BOOL isOpen;
@property (nonatomic , assign) BOOL isMain;
@property (nonatomic , strong) NSArray<LiModel *>* chArray;
@end

NS_ASSUME_NONNULL_END
