//
//  MovementsViewController.h
//  GandhiApp
//
//  Created by Kyle on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MovementsViewController : UITableViewController {
    NSMutableArray *movements;
}

-(void)createTable;

@end
