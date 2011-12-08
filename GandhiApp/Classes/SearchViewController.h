//
//  SearchViewController.h
//  GandhiApp
//
//  Created by Kyle on 12/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchViewController : UIViewController {
	IBOutlet UIWebView *searchView;
	NSURL *searchURL;
}

@property(nonatomic,retain)UIWebView *searchView;
@property(nonatomic,retain)NSURL *searchURL;

@end
