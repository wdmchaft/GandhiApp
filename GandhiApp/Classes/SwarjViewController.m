//
//  SwarjViewController.m
//  GandhiApp
//
//  Created by Kyle on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SwarjViewController.h"
#import "FoundationsViewController.h"
#import "PhilosophiesViewController.h"


@implementation SwarjViewController

-(void)createTable{
    swarj = [[NSMutableArray alloc]init];
    [swarj addObject:[[NSMutableDictionary alloc]
                      initWithObjectsAndKeys:@"Foundations",@"name",
                      @"foundation.png",@"pic", nil]];
    [swarj addObject:[[NSMutableDictionary alloc]
                      initWithObjectsAndKeys:@"Philosophies",@"name",
                      @"philosophies.png",@"pic",nil]];
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
    [swarj release];
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
    swarj = nil;
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
    return [swarj count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [[cell textLabel]setText:[[swarj objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell.textLabel.shadowColor = [UIColor lightGrayColor];
    cell.textLabel.shadowOffset = CGSizeMake(1, 1);
    
    [[cell imageView]setImage:[UIImage imageNamed:[[swarj objectAtIndex:indexPath.row]objectForKey:@"pic"]]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 120.0)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(1, 1);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"\"The real goal of the freedom struggle was not only to secure political independence, but rather to gain true swaraj -- liberation and self-rule.\"";
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 120.0);
    headerLabel.numberOfLines = 0;
    
    [customView addSubview:headerLabel];
    return customView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 120.0;
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
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    if([selectedCell.textLabel.text isEqualToString:@"Foundations"]){
        FoundationsViewController *foundationsViewController = [[FoundationsViewController alloc]
                                                        initWithNibName:@"FoundationsViewController"
                                                        bundle:nil];
        foundationsViewController.title = [[swarj objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:foundationsViewController animated:YES];
        [foundationsViewController release];
    }else{
        PhilosophiesViewController *philosophiesViewController = [[PhilosophiesViewController alloc]
                                                            initWithNibName:@"PhilosophiesViewController"
                                                            bundle:nil];
        philosophiesViewController.title = [[swarj objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:philosophiesViewController animated:YES];
        [philosophiesViewController release];
    }
}

@end
