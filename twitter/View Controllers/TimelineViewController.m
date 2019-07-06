//
//  TimelineViewController.m
//  twitter
//
//  Created by emersonmalca on 5/28/18.
//  Copyright © 2018 Emerson Malca. All rights reserved.
//

#import "TimelineViewController.h"
#import "APIManager.h"
#import "TweetCell.h"
#import "UIImageView+AFNetworking.h" //??
#import "Tweet.h"
#import "User.h"
#import "AppDelegate.h"
#import "LoginViewController.h"

@interface TimelineViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *tweetArray; //(tweets)
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation TimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    [self fetchTimeLine];
    
  
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    
    //change color of refresh controller to light blue
       [refreshControl setTintColor:[UIColor colorWithRed:102.0/255.0 green:204.0/255.0 blue:255.0/255.0 alpha:1.0]];
    
   
}

-(void)fetchTimeLine{
       // Get timeline
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            self.tweetArray = tweets;
            
            //loop through array of tweets, no need to allocate another array
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
        [self.refreshControl endRefreshing];
        // Stop the activity indicator
        // Hides automatically if "Hides When Stopped" is enabled
        [self.activityIndicator stopAnimating];
        //[self.tableView reloadData]; //??
    }];
   // [getHomeTimelineWithCompletion resume];
    //[task resume];
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


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
    TweetCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"TweetCell" forIndexPath:indexPath];
    Tweet *tweet= self.tweetArray[indexPath.row];
    
    cell.tweet = tweet;
    
    //setting each label to its part, setting tweet to actual tweet
    cell.name.text=tweet.user.name;
    cell.actualTweet.text = tweet.text;
    
    cell.screenUsername.text=tweet.user.screenName;
    
    cell.favoriteLabel.text = [NSString stringWithFormat:@"%d", tweet.favoriteCount];
      cell.retweetLabel.text = [NSString stringWithFormat:@"%d", tweet.retweetCount];
      cell.replyLabel.text = [NSString stringWithFormat:@"%d", tweet.replyCount];
    //displays date
    cell.date.text=tweet.createdAtString;
    
    //convert string to URL to load images for profile pictures
    NSURL *pP = [NSURL URLWithString:tweet.user.pP];
    //adds image to UIImageView from API
    [cell.profilePicture setImageWithURL:pP];

    return cell;
    
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetArray.count;
}

// Makes a network request to get updated data
// Updates the tableView with the new data
// Hides the RefreshControl
- (void)beginRefresh:(UIRefreshControl *)refreshControl {
 
    //GET request

    // APIManager *getRequest = [[APIManager alloc] init];
    [[APIManager shared] getHomeTimelineWithCompletion:^(NSArray *tweets, NSError *error) {
        // handle successful tweet
        // handle the error
        if (tweets) {
            NSLog(@"😎😎😎 Successfully loaded home timeline");
            
            self.tweetArray = tweets;
            
            //loop through array of tweets, no need to allocate another array
            for (Tweet *tweet in tweets) {
                NSString *text = tweet.text;
                NSLog(@"%@", text);
            }
            [self.tableView reloadData];
        } else {
            NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
        }
    }];
    
    // Reload the tableView now that there is new data
    [self.tableView reloadData];
    
    // Tell the refreshControl to stop spinning
    [refreshControl endRefreshing];
 
}

- (IBAction)logoutTapped:(id)sender {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    appDelegate.window.rootViewController = loginViewController;

[[APIManager shared] logout];

}

@end
