//
//  SearchViewController.h
//  iGad
//
//  Created by Khanh Do on 7/4/15.
//  Copyright (c) 2015 Khanh Do. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<
                                        UITableViewDataSource,
                                        UITableViewDelegate>
@property IBOutlet UITableView *searchTable;
@end
