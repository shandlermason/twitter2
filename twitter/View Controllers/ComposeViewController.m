//
//  ComposeViewController.m
//  
//
//  Created by samason1 on 7/3/19.
//

#import "ComposeViewController.h"
#import "APIManager.h"
@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextField;
@property (weak, nonatomic) IBOutlet UITextView *countTextView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self textViewDidBeginEditing:(UITextView *)_tweetTextField];
    self.countTextView.delegate = self;
    self.countLabel.text=@"140";
   
}

- (void) textViewDidBeginEditing:(UITextView *) textView {
   //clears out text view when typing starts
    [textView setText:@""];
    NSUInteger length, length2;
    length = [textView.text length];
    length2=length -1;
    self.countLabel.text = [NSString stringWithFormat:@"%u", length2];
    NSLog(@"Character count decreased");
    
}


//create an action for the “Close” button and the “Tweet” button
- (IBAction)closeTweet:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

//create an action for the “Tweet” button
- (IBAction)publishTweet:(id)sender {
    NSLog(@"Hit Tweet button!");
    
    //passes the tweet typed through the network connection to post onto my twitter
    [[APIManager shared] postStatusWithText: [self.tweetTextField text] completion:^(Tweet *tweet, NSError *error){
      if (tweet) {
          NSLog(@"😎😎😎 Successfully loaded home timeline");
        }
      else {
          NSLog(@"😫😫😫 Error getting home timeline: %@", error.localizedDescription);
      }
    }];
    //manually dismiss view controller when finish posting tweet
    [self dismissModalViewControllerAnimated:YES];
    
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
