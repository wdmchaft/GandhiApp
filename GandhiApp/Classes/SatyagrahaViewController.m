//
//  SatyagrahaViewController.m
//  GandhiApp
//
//  Created by Kyle on 12/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SatyagrahaViewController.h"
#import "LeadersViewController.h"
#import "MovementsViewController.h"


@implementation SatyagrahaViewController

-(void)createTable{
    satyagraha = [[NSMutableArray alloc]init];
    [satyagraha addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Leaders",@"name",
                           @"leadership.png",@"pic", nil]];
    [satyagraha addObject:[[NSMutableDictionary alloc]
                           initWithObjectsAndKeys:@"Movements",@"name",
                           @"movement.png",@"pic", nil]];
    
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
    [satyagraha release];
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
    satyagraha = nil;
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
    return [satyagraha count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    [[cell textLabel]setText:[[satyagraha objectAtIndex:indexPath.row]objectForKey:@"name"]];
    cell.textLabel.shadowColor = [UIColor lightGrayColor];
    cell.textLabel.shadowOffset = CGSizeMake(1, 1);
    
    [[cell imageView]setImage:[UIImage imageNamed:[[satyagraha objectAtIndex:indexPath.row]objectForKey:@"pic"]]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 160.0)];
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(1, 1);
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.text = @"\"Civil disobedience is not only the natural right of a people, especially when they have no effective voice in their own Government, but that it is also a substitute for violence or armed rebellion.\"";
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 160.0);
    headerLabel.numberOfLines = 0;
    
    [customView addSubview:headerLabel];
    return customView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 160.0;
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
    if([selectedCell.textLabel.text isEqualToString:@"Leaders"]){
        LeadersViewController *leadersViewController = [[LeadersViewController alloc]
                                                        initWithNibName:@"LeadersViewController"
                                                        bundle:nil];
        leadersViewController.title = [[satyagraha objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:leadersViewController animated:YES];
        [leadersViewController release];
    }else{
        MovementsViewController *movementsViewController = [[MovementsViewController alloc]
                                                            initWithNibName:@"MovementsViewController"
                                                            bundle:nil];
        movementsViewController.title = [[satyagraha objectAtIndex:indexPath.row]objectForKey:@"name"];
        [self.navigationController pushViewController:movementsViewController animated:YES];
        [movementsViewController release];
    }
}

@end
