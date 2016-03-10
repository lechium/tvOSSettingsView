//
//  ViewController.m
//  SettingsViewTest
//
//  Created by Kevin Bradley on 3/9/16.
//  Copyright © 2016 nito. All rights reserved.
//

#import "SettingsViewController.h"
#import "RZSplitViewController.h"

@implementation SettingsTableViewCell

@synthesize viewBackgroundColor, selectionColor;

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.selectionColor == nil)
        self.selectionColor = [UIColor whiteColor];
    
    if (self.viewBackgroundColor == nil)
        self.viewBackgroundColor = self.contentView.backgroundColor;
}

- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    [super didUpdateFocusInContext:context withAnimationCoordinator:coordinator];
    if (context.nextFocusedView == self)
    {
        [coordinator addCoordinatedAnimations:^{
            // self.backgroundColor = [UIColor darkGrayColor];
            self.contentView.backgroundColor = self.selectionColor;
        
            //NSLog(@"superview: %@",  self.superview.superview.superview.superview.superview.superview);
        } completion:^{
            //
        }];
        
    } else {
        [coordinator addCoordinatedAnimations:^{
            //self.backgroundColor = [UIColor blackColor];
            self.contentView.backgroundColor = self.viewBackgroundColor;
        } completion:^{
            //
        }];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize imageNames;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect selfFrame = [self.view frame];
    selfFrame.size.width = selfFrame.size.width / 2;
    CGRect imageRect = CGRectMake((selfFrame.size.width - 512)/2, (selfFrame.size.height - 382)/2, 512, 382);
    self.imageView = [[UIImageView alloc] initWithFrame:imageRect];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageView setImage:[UIImage imageNamed:@"YTPlaceholder"]];
    [[self view]addSubview:self.imageView];
   // self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
}

- (void)selectedItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.imageNames.count)
    {
        UIImage *theImage = [UIImage imageNamed:imageNames[indexPath.row]];
        [self.imageView setImage:theImage];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 20, 0);
    //self.view.backgroundColor = [UIColor blackColor];
    [self.tableView registerClass:[SettingsTableViewCell class] forCellReuseIdentifier:@"Science"];
    //self.tableView.maskView = nil;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)selectedItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(selectedItemAtIndexPath:)])
    {
        [self.delegate selectedItemAtIndexPath:indexPath];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (void)didUpdateFocusInContext:(UIFocusUpdateContext *)context withAnimationCoordinator:(UIFocusAnimationCoordinator *)coordinator
{
    [self focusedCell:(SettingsTableViewCell*)context.nextFocusedView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.itemNames.count;
}

- (void)focusedCell:(SettingsTableViewCell *)focusedCell
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:focusedCell];
    [self.delegate selectedItemAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.selectionDelegate respondsToSelector:@selector(itemSelectedAtIndexPath:)])
    {
        [self.selectionDelegate itemSelectedAtIndexPath:indexPath];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Science"forIndexPath:indexPath];
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.itemNames[indexPath.row];
    cell.viewBackgroundColor = self.view.backgroundColor;
    if (self.view.backgroundColor == [UIColor blackColor])
    {
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.selectionColor = [UIColor darkGrayColor];
    }
    
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
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

@interface SettingsViewController ()

@end

@implementation SettingsViewController

@synthesize delegate;

- (void)viewDidLoad {
    
    [super viewDidLoad];
     // Do any additional setup after loading the view, typically from a nib.
    
    RZSplitViewController *splitViewController = [RZSplitViewController new];
    self.viewControllers = @[splitViewController];
    splitViewController.view.backgroundColor = self.backgroundColor;
    SettingsTableViewController *masterTableViewController = [[SettingsTableViewController alloc] init];
    masterTableViewController.itemNames = self.itemNames;
    masterTableViewController.selectionDelegate = self;
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.view.backgroundColor = self.backgroundColor;
    detailViewController.imageNames = self.imageNames;
    masterTableViewController.view.backgroundColor = self.backgroundColor;
    masterTableViewController.delegate = detailViewController;
    [splitViewController setViewControllers:@[detailViewController,masterTableViewController]];
    [splitViewController setTitle:self.viewTitle];

   
}

- (void)itemSelectedAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(itemSelectedAtIndexPath:fromNavigationController:)])
    {
        [self.delegate itemSelectedAtIndexPath:indexPath fromNavigationController:self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
