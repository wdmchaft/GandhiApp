//
//  RootViewController.h
//  GandhiApp
//
//  Created by Kyle on 12/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSMutableArray *categories;
}

-(void)createCategories;

@end
