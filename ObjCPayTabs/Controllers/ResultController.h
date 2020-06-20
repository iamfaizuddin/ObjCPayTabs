//
//  ResultController.h
//  ObjCPayTabs
//
//  Created by Personal on 20/06/20.
//  Copyright © 2020 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResultController : UIViewController

@property (nonatomic, strong) NSString *result;
@property (nonatomic, assign) NSInteger responseCode;

@property (weak, nonatomic) IBOutlet UILabel *lblResponse;
@property (weak, nonatomic) IBOutlet UILabel *lblResult;

@end

NS_ASSUME_NONNULL_END
