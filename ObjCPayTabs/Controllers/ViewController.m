//
//  ViewController.m
//  ObjCPayTabs
//
//  Created by Personal on 20/06/20.
//  Copyright © 2020 Personal. All rights reserved.
//

#import "ViewController.h"
#import <paytabs-iOS/paytabs_iOS.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

 // Function to handle Click event for checkout button //
- (IBAction)btnCheckoutClicked:(id)sender {
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"Resources" withExtension:@"bundle"]];

    PTFWInitialSetupViewController *view = [[PTFWInitialSetupViewController alloc]
                                            initWithBundle:bundle
                                            andWithViewFrame:self.view.frame
                                            andWithAmount:6.0
                                            andWithCustomerTitle:@"Paytabs Sample App"
                                            andWithCurrencyCode:@"USD"
                                            andWithTaxAmount:0
                                            andWithSDKLanguage:@"en"
                                            andWithShippingAddress:@"test test"
                                            andWithShippingCity:@"Juffair"
                                            andWithShippingCountry:@"BHR"
                                            andWithShippingState:@"Manama"
                                            andWithShippingZIPCode:@"00973"
                                            andWithBillingAddress:@"test test"
                                            andWithBillingCity:@"Juffair"
                                            andWithBillingCountry:@"BHR"
                                            andWithBillingState:@"Manama"
                                            andWithBillingZIPCode:@"00973"
                                            andWithOrderID:@"12345"
                                            andWithPhoneNumber:@"+97333109781"
                                            andWithCustomerEmail:@"rhegazy@paytabs.com"
                                            andIsTokenization:NO
                                            andIsPreAuth:NO
                                            andWithMerchantEmail:@"iamfaizuddin@gmail.com"
                                        andWithMerchantSecretKey:@"tfMdqLELHiRylagnmHP22ri7SjrBJSid75qxQ5jxob6Jmn6I4WK7o3ehnGT7zbkGgLe7QxFeJLY595Nd2ylqBAIZgB6PNrw4cKb3"
                                            andWithAssigneeCode:@"SDK"
                                            andWithThemeColor:[UIColor redColor]
                                            andIsThemeColorLight:YES];

    view.didReceiveBackButtonCallback = ^{
        UIViewController *rootViewController = [[[[UIApplication sharedApplication]delegate] window] rootViewController];
        [rootViewController dismissViewControllerAnimated:YES completion:nil];
    };

    view.didStartPreparePaymentPage = ^{
        // Start Prepare Payment Page
        // Show loading indicator
    };

    view.didFinishPreparePaymentPage = ^{
        // Finish Prepare Payment Page
        // Stop loading indicator
    };

    view.didReceiveFinishTransactionCallback = ^(int responseCode, NSString * _Nonnull result, int transactionID, NSString * _Nonnull tokenizedCustomerEmail, NSString * _Nonnull tokenizedCustomerPassword, NSString * _Nonnull token, BOOL transactionState) {
        NSLog(@"Response Code: %i", responseCode);
        NSLog(@"Response Result: %@", result);

        // In Case you are using tokenization
        NSLog(@"Tokenization Cutomer Email: %@", tokenizedCustomerEmail);
        NSLog(@"Tokenization Customer Password: %@", tokenizedCustomerPassword);
        NSLog(@"TOkenization Token: %@", token);

        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ResultController *resultController = [storyboard instantiateViewControllerWithIdentifier:@"ResultController"];
        resultController.responseCode = responseCode;
        resultController.result = result;
        [view presentViewController:resultController animated:YES completion:nil];
    };

    [self presentViewController:view animated:true completion:nil];
}
@end
