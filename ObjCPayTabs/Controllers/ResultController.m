//
//  ResultController.m
//  ObjCPayTabs
//
//  Created by Personal on 20/06/20.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ResultController.h"

@interface ResultController ()

@end

@implementation ResultController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.responseCode == 100){
        self.lblResponse.text = @"Successfull";
    }else{
        self.lblResponse.text = @"Failed";
    }
    
    self.lblResult.text = self.result;
}

@end
