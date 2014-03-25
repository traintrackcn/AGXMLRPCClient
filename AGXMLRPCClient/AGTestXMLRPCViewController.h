//
//  AGTestXMLRPCViewController.h
//  AboveGEM
//
//  Created by traintrackcn on 20/3/14.
//  Copyright (c) 2014 2ViVe. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "XMLRPCConnectionDelegate.h"

@interface AGTestXMLRPCViewController : UIViewController {
    IBOutlet UITextView *requestContentV;
    IBOutlet UITextView *responseContentV;
}

- (IBAction)didTapSendButton:(id)sender;

@end
