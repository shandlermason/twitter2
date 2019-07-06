//
//  TweetCell.m
//  twitter
//
//  Created by samason1 on 7/2/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "TweetCell.h"
#import "APIManager.h"

@implementation TweetCell

//like the view did load method
- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    _favoriteButton.selected=NO;
    // Initialization code
    
    
    //Updates the button to show the corrct images
   [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateSelected];
  
   [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    
    [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateSelected];
    
    [self.replyButton setImage:[UIImage imageNamed:@"reply-icon"] forState:UIControlStateNormal];
   
}

//Action that happens when you tap the like button
- (IBAction)didTapLike:(id)sender {
   
    if(self.favoriteButton.selected==YES){
        self.tweet.favorited = NO;
        self.tweet.favoriteCount -= 1;
        self.favoriteButton.selected = NO;
        NSLog(@"Button was unselected!");
       
    }
    else {
   
        // TODO: Update the local tweet model
        self.tweet.favorited = YES;
        self.tweet.favoriteCount += 1;
        self.favoriteButton.selected = YES;
        NSLog(@"Button was selected!");
    }
  
    // TODO: Update cell UI
   [self refreshData];
    
    // TODO: Send a POST request to the POST favorites/create endpoint
    [self postRequest];
 
}
- (IBAction)didTapRetweet:(id)sender {
    if(self.retweetButton.selected==YES){
        self.tweet.retweeted = NO;
        self.tweet.retweetCount -= 1;
        self.retweetButton.selected = NO;
        NSLog(@"Button was unselected!");
        
    }
    else {
        
        // TODO: Update the local tweet model
        self.tweet.retweeted = YES;
        self.tweet.retweetCount += 1;
        self.retweetButton.selected = YES;
        NSLog(@"Button was selected!");
    }
    
    // TODO: Update cell UI
    [self refreshData];
    
    // TODO: Send a POST request to the POST retweet/create endpoint
    [self postRequest];
    
}
- (IBAction)didTapReply:(id)sender {
    
    
    
}


- (void)refreshData{
    //updates the number when the heart button is pressed
    _favoriteLabel.text=[NSString stringWithFormat: @"%d", self.tweet.favoriteCount];
    _retweetLabel.text=[NSString stringWithFormat: @"%d", self.tweet.retweetCount];
}

-(void)postRequest{
    
    // TODO: Send a POST request to the POST favorites/create endpoint
    [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
        if(error){
            NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
        }
        else{
            NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
        }
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
