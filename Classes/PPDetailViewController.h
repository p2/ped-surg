//
//  PPDetailViewController.h
//  ped-surg
//
//  Created by Pascal Pfiffner on 2/23/13.
//  Copyright (c) 2013 Pascal Pfiffner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end
