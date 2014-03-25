//
//  AGTestXMLRPCViewController.m
//  AboveGEM
//
//  Created by traintrackcn on 20/3/14.
//  Copyright (c) 2014 2ViVe. All rights reserved.
//

#import "AGTestXMLRPCViewController.h"
//#import "XMLRPCConnectionManager.h"
//#import "XMLRPCRequest.h"
//#import "XMLRPCResponse.h"
#import "WPXMLRPCClient.h"
#import "GlobalDefine.h"

@interface AGTestXMLRPCViewController ()

@end

@implementation AGTestXMLRPCViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self assembleConnection];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 

/**
[20/3/14 2:29:46 pm] Andy Lu: DB = 'demo_20140226'
USERNAME = 'ca'#用户名
USERPASS = 'ca@og_user' #密码
sock_common = xmlrpclib.ServerProxy ('http://199.27.105.132:9069/xmlrpc/common')
uid = sock_common.login(DB, USERNAME, USERPASS)
sock = xmlrpclib.ServerProxy('http://%s:%s/xmlrpc/object' % ('199.27.105.132',9069))
company_ids = sock.execute(DB, uid, USERPASS, 'res.company','search',[('ref','=', 'CA' )])

**/



- (void)sendAction{
//    NSString *db = @"demo_20140226";
//    NSString *user = @"ca";
//    NSString *pass = @"ca@og_user";
//    NSURL *URL = [NSURL URLWithString: @"http://199.27.105.132:9069/xmlrpc/db'"];
//    XMLRPCRequest *request = [[XMLRPCRequest alloc] initWithURL: URL];
//    [request setMethod: @"login" withParameters: [NSArray arrayWithObjects:db,user,pass, nil]];
//    [request setMethod:@"list" withParameter:nil];
//    NSLog(@"req -> %@", [request body]);
//    [[XMLRPCConnectionManager sharedManager] spawnConnectionWithXMLRPCRequest: request delegate: self];
//    NSLog(@"connectionIdentifier -> %@", connectionIdentifier);
    
//    [requestContentV setText:[request body]];
//    [responseContentV setText:@""];
    
//    ==========================================
    
//    NSURL *xmlrpc = [NSURL URLWithString: @"http://199.27.105.132:9069/xmlrpc/db"];
//    WPXMLRPCClient *client = [[WPXMLRPCClient alloc] initWithXMLRPCEndpoint:xmlrpc];
//    NSArray *parameters = nil;
//    [client callMethod:@"list"
//                 parameters:parameters
//                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                        TLOG(@"responseObject -> %@", responseObject);
//                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                        TLOG(@"error -> %@", error);
//                    }];
    
    
    NSURL *xmlrpc = [NSURL URLWithString: @"http://199.27.105.132:9069/xmlrpc/common"];
    NSArray *parameters = @[@"demo_20140226",@"ca",@"ca@og_user"];
    WPXMLRPCClient *client = [[WPXMLRPCClient alloc] initWithXMLRPCEndpoint:xmlrpc];
    WPXMLRPCRequest *request = [client XMLRPCRequestWithMethod:@"login" parameters:parameters];
//    [requestContentV setText:[request body]];
//    [responseContentV setText:@""];
    WPXMLRPCRequestOperation *operation = [client XMLRPCRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
        TLOG(@"responseObject -> %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        TLOG(@"error -> %@", error);
    }];
    
    [client enqueueXMLRPCRequestOperation:operation];
}

#pragma mark - interactive actions

- (void)didTapSendButton:(id)sender{
    [self sendAction];
}


#pragma mark - XMLRPCConnectionDelegate

//
//
//- (void)request:(XMLRPCRequest *)request didReceiveResponse:(XMLRPCResponse *)response{
////    TLOG(@"%@ ", response.description);
////    NSLog(@"%@", response.debugDescription);
//    if ([response isFault]) {
//        [responseContentV setText:response.faultString];
//        NSLog(@"response.faultString -> %@", response.faultString);
//    }else{
//        [responseContentV setText:response.body];
//    }
//}
//
//- (void)request:(XMLRPCRequest *)request didFailWithError:(NSError *)error{
////    NSLog(@"");
//}
//
//- (void)request:(XMLRPCRequest *)request didSendBodyData:(float)percent{
////    TLOG(@"percent -> %f", percent);
//}
//
//
//
//- (BOOL)request:(XMLRPCRequest *)request canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace{
//    //    NSLog(@"");
//    return NO;
//}
//
//- (void)request:(XMLRPCRequest *)request didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge{
//    //    NSLog(@"");
//}
//
//- (void)request: (XMLRPCRequest *)request didReceiveAuthenticationChallenge: (NSURLAuthenticationChallenge *)challenge {
//	if ([challenge previousFailureCount] == 0) {
//		NSURLCredential *credential = [NSURLCredential credentialWithUser: @"user" password: @"password" persistence: NSURLCredentialPersistenceNone];
//		
//		[[challenge sender] useCredential: credential  forAuthenticationChallenge: challenge];
//	} else {
//		[[challenge sender] cancelAuthenticationChallenge: challenge];
//	}
//}


@end
