//
//  AhimsaViewController.m
//  GandhiApp
//
//  Created by Kyle on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AhimsaViewController.h"
#import "SearchViewController.h"

@implementation AhimsaViewController

-(void)createTable{

    ahimsa = [[NSMutableArray alloc]init];

    [ahimsa addObject:[[NSMutableDictionary alloc]
                   initWithObjectsAndKeys:@"Nonviolence",@"name",
                   @"nonviolence.png",@"pic",@"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+nonviolence",
                   @"url",nil]];
    [ahimsa addObject:[[NSMutableDictionary alloc]
                   initWithObjectsAndKeys:@"God",@"name",@"god.png",@"pic",
                   @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+god",
                   @"url",nil]];
    [ahimsa addObject:[[NSMutableDictionary alloc]
                   initWithObjectsAndKeys:@"Religion",@"name",
                   @"religion.png",@"pic",
                   @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+religion",
                   @"url",nil]];
    [ahimsa addObject:[[NSMutableDictionary alloc]
                   initWithObjectsAndKeys:@"Secularism",@"name",
                   @"secularism.png",@"pic",
                   @"http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=gandhi+and+secularism",
                   @"url",nil]];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [ahimsa release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];
    [self createTable];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    ahimsa = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [ahimsa count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [[cell textLabel]setText:[[ahimsa objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell.textLabel.shadowColor = [UIColor lightGrayColor];
    cell.textLabel.shadowOffset = CGSizeMake(1, 1);
    
    [[cell imageView]setImage:[UIImage imageNamed:[[ahimsa objectAtIndex:indexPath.row]objectForKey:@"pic"]]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(10.0, 0.0, 300.0, 100.00)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(1, 1);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"\"The power of unarmed nonviolence is any day far superior to that of armed force.\"";
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 100.0);
    headerLabel.numberOfLines = 0;
    
    [customView addSubview:headerLabel];
    return customView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100.0;
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *customView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, 300, 50)];
    UILabel *footerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    footerLabel.textAlignment = UITextAlignmentCenter;
    footerLabel.textColor = [UIColor whiteColor];
    footerLabel.shadowColor = [UIColor blackColor];
    footerLabel.shadowOffset = CGSizeMake(1, 1);
    footerLabel.backgroundColor = [UIColor clearColor];
    footerLabel.text = @"© The Khanna Group, LLC";
    footerLabel.frame = CGRectMake(10, 0, 300, 50);
    footerLabel.numberOfLines = 0;
    
    [customView addSubview:footerLabel];
    return customView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SearchViewController *searchViewController=[[SearchViewController alloc]
												initWithNibName:@"SearchViewController"
												bundle:nil];
    searchViewController.searchURL = [[NSURL alloc] initWithString:[[ahimsa objectAtIndex:indexPath.row] objectForKey:@"url"]];
	searchViewController.title= [[ahimsa objectAtIndex:indexPath.row]objectForKey:@"name"];
	[self.navigationController pushViewController:searchViewController animated:YES];
	[searchViewController release];
}

@end
