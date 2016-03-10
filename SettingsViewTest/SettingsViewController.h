//
//  ViewController.h
//  SettingsViewTest
//
//  Created by Kevin Bradley on 3/9/16.
//  Copyright © 2016 nito. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LOG_SELF        NSLog(@"%@ %@", self, NSStringFromSelector(_cmd))

@class SettingsTableViewController;

@interface SettingsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIColor *selectionColor;
@property (nonatomic, strong) UIColor *viewBackgroundColor;

@end

@protocol DetailViewSelectionDelegate <NSObject>

- (void)selectedItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface DetailViewController : UIViewController <DetailViewSelectionDelegate>


@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, weak) NSArray *imageNames;

@end

@protocol SettingsTableViewSelectionDelegate <NSObject>

- (void)itemSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SettingsTableViewController : UITableViewController <DetailViewSelectionDelegate>

@property (nonatomic, weak) id<SettingsTableViewSelectionDelegate> selectionDelegate;
@property (nonatomic, weak) id<DetailViewSelectionDelegate> delegate;
@property (nonatomic, strong) NSArray *itemNames;

- (void)focusedCell:(UITableViewCell *)focusedCell;

@end


@class SettingsViewController;

@protocol SettingsViewDelegate <NSObject>

- (void)itemSelectedAtIndexPath:(NSIndexPath *)indexPath fromNavigationController:(SettingsViewController *)me;

@end

@interface SettingsViewController : UINavigationController <SettingsTableViewSelectionDelegate>

@property (nonatomic, weak) id <SettingsViewDelegate> delegate;
@property (nonatomic, strong) NSArray *itemNames;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSString *viewTitle;
@property (nonatomic, strong) UIColor *backgroundColor;


@end



