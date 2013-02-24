//
//  PPMasterViewController.m
//  ped-surg
//
//  Created by Pascal Pfiffner on 2/23/13.
//  Copyright (c) 2013 Pascal Pfiffner. All rights reserved.
//

#import "PPMasterViewController.h"
#import "PPDetailViewController.h"


@interface PPMasterViewController () {
	NSMutableArray *_objects;
}
@end


@implementation PPMasterViewController


- (id)init
{
	return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
		self.title = NSLocalizedString(@"Master", @"Master");
		if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
			self.clearsSelectionOnViewWillAppear = NO;
			self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
		}
	}
	return self;
}



#pragma mark - Table View
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _objects.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
			cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		}
	}


	NSDate *object = _objects[indexPath.row];
	cell.textLabel.text = [object description];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSDate *object = _objects[indexPath.row];
	
	// iPhone
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
		if (!self.detailViewController) {
			self.detailViewController = [PPDetailViewController new];
		}
		self.detailViewController.detailItem = object;
		[self.navigationController pushViewController:self.detailViewController animated:YES];
	}
	
	// iPad
	else {
		self.detailViewController.detailItem = object;
	}
}


@end
