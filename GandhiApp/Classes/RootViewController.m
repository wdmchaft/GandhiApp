//
//  RootViewController.m
//  GandhiApp
//
//  Created by Kyle on 12/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "AhimsaViewController.h"
#import "LifeViewController.h"
#import "SatyagrahaViewController.h"
#import "SwarjViewController.h"

@implementation RootViewController

-(void)createCategories{
	categories=[[NSMutableArray alloc]init];
    [categories addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Ahimsa",@"name",
                           @"(Nonviolence)",@"subtitle",
                           @"ahimsa.png",@"pic", nil]];
    [categories addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Satyagraha",@"name",
                           @"(Civil Disobedience)",@"subtitle",
                           @"satyagraha.png",@"pic", nil]];
    [categories addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Swarj",@"name",
                           @"(Self-Rule)",@"subtitle",
                           @"swarj.png",@"pic", nil]];
    [categories addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Gandhi's Life",@"name",
                           @"(About Gandhi)",@"subtitle",
                           @"life.png",@"pic", nil]];
}



#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
	[self createCategories];
    [super viewDidLoad];
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/


 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return YES;
}



#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [categories count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	[[cell textLabel]setText:[[categories objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell.textLabel.shadowColor = [UIColor lightGrayColor];
    cell.textLabel.shadowOffset = CGSizeMake(1, 1);
	
	[[cell imageView]setImage:[UIImage imageNamed:[[categories objectAtIndex:indexPath.row]objectForKey:@"pic"]]];
	cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    NSString *subtitle = [[categories objectAtIndex:indexPath.row]valueForKey:@"subtitle"];
    cell.detailTextLabel.text = subtitle;
    cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:12];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    return cell;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 100.0)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(1, 1);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"\"You are not followers but fellow students, fellow pilgrims, fellow seekers, fellow workers.\"";
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 100.0);
    headerLabel.numberOfLines = 0;
    
    [customView addSubview:headerLabel];
    return customView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100.0;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if([selectedCell.textLabel.text isEqualToString:@"Ahimsa"]){
        AhimsaViewController *ahimsaViewController = [[AhimsaViewController alloc]
                                                      initWithNibName:@"AhimsaViewController"
                                                      bundle:nil];
        ahimsaViewController.title = [[categories objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:ahimsaViewController animated:YES];
        [ahimsaViewController release];
    }else if([selectedCell.textLabel.text isEqualToString:@"Satyagraha"]){
        SatyagrahaViewController *satyagrahaViewController = [[SatyagrahaViewController alloc]
                                                              initWithNibName:@"SatyagrahaViewController"
                                                              bundle:nil];
        satyagrahaViewController.title = [[categories objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:satyagrahaViewController animated:YES];
        [satyagrahaViewController release];
    }else if([selectedCell.textLabel.text isEqualToString:@"Swarj"]){
        SwarjViewController *swarjViewController = [[SwarjViewController alloc]
                                                    initWithNibName:@"SwarjViewController"
                                                    bundle:nil];
        swarjViewController.title = [[categories objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:swarjViewController animated:YES];
        [swarjViewController release];
    }else{
        LifeViewController *lifeViewController = [[LifeViewController alloc]
                                                  initWithNibName:@"LifeViewController"
                                                  bundle:nil];
        lifeViewController.title = [[categories objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:lifeViewController animated:YES];
        [lifeViewController release];
    }
}

/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchViewController *searchViewController=[[SearchViewController alloc]
												initWithNibName:@"SearchViewController"
												bundle:nil];
	searchViewController.searchURL=[[NSURL alloc]initWithString:
									[[[subcategories objectAtIndex:indexPath.section]
									  objectAtIndex:indexPath.row]objectForKey:@"url"]];
	searchViewController.title=
		[[[subcategories objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]
		 objectForKey:@"name"];
	[self.navigationController pushViewController:searchViewController animated:YES];
	[searchViewController release];
}
*/

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    categories = nil;
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[categories release];
    [super dealloc];
}


@end

