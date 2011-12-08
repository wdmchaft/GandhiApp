//
//  RootViewController.m
//  GandhiApp
//
//  Created by Kyle on 12/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "SearchViewController.h"


@implementation RootViewController

-(void)createSubcategories{
	NSMutableArray *nonviolence;
	NSMutableArray *democracy;
	NSMutableArray *freedom;
	NSMutableArray *religion;
	NSMutableArray *media;
	
	categories=[[NSMutableArray alloc]initWithObjects:@"Nonviolence",@"Democracy",
				@"Freedom",@"Religion",@"Media",nil];
	
	nonviolence=[[NSMutableArray alloc]init];
	democracy=[[NSMutableArray alloc]init];
	freedom=[[NSMutableArray alloc]init];
	religion=[[NSMutableArray alloc]init];
	media=[[NSMutableArray alloc]init];
	
	[nonviolence addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Civil Disobedience",
							@"name",@"occupy.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+civil+disobedience",
							@"url",nil]];
	[nonviolence addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Nelson Mandela",@"name",
							@"mandela.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+nelson+mandela",
							@"url",nil]];
	[nonviolence addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Martin Luther King, Jr.",@"name",
							@"mlk.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+martin+luther+king+jr",
							@"url",nil]];
	[nonviolence addObject:[[NSMutableDictionary alloc]
							initWithObjectsAndKeys:@"Lech Walesa",@"name",
							@"lech.png",@"pic",
							@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+lech+walesa",
							@"url",nil]];
	[democracy addObject:[[NSMutableDictionary alloc]
						  initWithObjectsAndKeys:@"Constitution",@"name",
						  @"indiaconstitution.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+constitution",
						  @"url",nil]];
	[democracy addObject:[[NSMutableDictionary alloc]
						  initWithObjectsAndKeys:@"Civil Law",@"name",
						  @"civillaw.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+civil+law",
						  @"url",nil]];
	[democracy addObject:[[NSMutableDictionary alloc]
						  initWithObjectsAndKeys:@"Civil Society",@"name",
						  @"multiculturalism.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+civil+society",
						  @"url",nil]];
	[democracy addObject:[[NSMutableDictionary alloc]
						  initWithObjectsAndKeys:@"Institutions",@"name",
						  @"un.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+institutions",
						  @"url",nil]];
	[freedom addObject:[[NSMutableDictionary alloc]
						initWithObjectsAndKeys:@"Social",@"name",
						@"socialfreedom.png",@"pic",
						@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+social+freedom",
						@"url",nil]];
	[freedom addObject:[[NSMutableDictionary alloc]
						initWithObjectsAndKeys:@"Political",@"name",
						@"politicalfreedom.png",@"pic",
						@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+political+freedom",
						@"url",nil]];
	[freedom addObject:[[NSMutableDictionary alloc]
						initWithObjectsAndKeys:@"Economic",@"name",
						@"economicfreedom.png",@"pic",
						@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+economic+freedom",
						@"url",nil]];
	[religion addObject:[[NSMutableDictionary alloc]
						 initWithObjectsAndKeys:@"God",@"name",
						 @"god.png",@"pic",
						 @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+god",
						 @"url",nil]];
	[religion addObject:[[NSMutableDictionary alloc]
						 initWithObjectsAndKeys:@"Spirituality",@"name",
						 @"spirituality.png",@"pic",
						 @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+spirituality",
						 @"url",nil]];
	[religion addObject:[[NSMutableDictionary alloc]
						 initWithObjectsAndKeys:@"Secularism",@"name",
						 @"secularism.png",@"pic",
						 @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+on+secularism",
						 @"url",nil]];
	[media addObject:[[NSMutableDictionary alloc]
					  initWithObjectsAndKeys:@"Movies",@"name",
					  @"movies.png",@"pic",
					  @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+movies",
					  @"url",nil]];
	[media addObject:[[NSMutableDictionary alloc]
					  initWithObjectsAndKeys:@"Biographies",@"name",
					  @"biographies.png",@"pic",
					  @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+biographies",
					  @"url",nil]];
	[media addObject:[[NSMutableDictionary alloc]
					  initWithObjectsAndKeys:@"Articles",@"name",
					  @"articles.png",@"pic",
					  @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+articles",
					  @"url",nil]];
	[media addObject:[[NSMutableDictionary alloc]
					  initWithObjectsAndKeys:@"Documentaries",@"name",
					  @"documentaries.png",@"pic",
					  @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+documentaries",
					  @"url",nil]];
	subcategories=[[NSMutableArray alloc]initWithObjects:
				   nonviolence,democracy,freedom,religion,media,nil];
	[nonviolence release];
	[democracy release];
	[freedom release];
	[religion release];
	[media release];
}

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
	[self createSubcategories];
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

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [categories count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[subcategories objectAtIndex:section]count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return [categories objectAtIndex:section];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	[[cell textLabel]setText:[[[subcategories objectAtIndex:indexPath.section]
							   objectAtIndex:indexPath.row]objectForKey:@"name"]];
	
	[[cell imageView]setImage:[UIImage imageNamed:[[[subcategories objectAtIndex:indexPath.section]
													objectAtIndex:indexPath.row]objectForKey:@"pic"]]];
	cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    return cell;
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


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[categories release];
	[subcategories release];
    [super dealloc];
}


@end

