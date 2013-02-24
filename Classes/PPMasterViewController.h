//
//  PPMasterViewController.h
//  ped-surg
//
//  Created by Pascal Pfiffner on 2/23/13.
//  Copyright (c) 2013 Pascal Pfiffner. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PPDetailViewController;


@interface PPMasterViewController : UITableViewController

@property (strong, nonatomic) PPDetailViewController *detailViewController;

@end
