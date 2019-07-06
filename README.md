# Project 3 - *Twitter2*

**Twitter2** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **30** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen
- [X] User can sign in using OAuth login flow
- [X] User can Logout
- [X] User can view last 20 tweets from their home timeline
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] User can pull to refresh.
- [X] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [X] User can compose a new tweet by tapping on a compose button.
- [X] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.

The following **optional** features are implemented:

- [ ] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [ ] User can view their profile in a *profile tab*
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
  - [ ] Profile view should include that user's timeline
- [ ] User should display the relative timestamp for each tweet "8m", "7h"
- [X] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count. Refer to [[this guide|unretweeting]] for help on implementing unretweeting.
- [ ] Links in tweets are clickable.
- [ ] User can tap the profile image in any tweet to see another user's profile
  - Contains the user header view: picture and tagline
  - Contains a section with the users basic stats: # tweets, # following, # followers
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] When composing, you should have a countdown for the number of characters remaining for the tweet (out of 140) (**1 point**)
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet (**2 points**)
- [ ] User sees embedded images in tweet if available
- [ ] User can switch between timeline, mentions, or profile view through a tab bar (**3 points**)
- [ ] Profile Page: pulling down the profile page should blur and resize the header image. (**4 points**)


The following **additional** features are implemented:

List anything else that you can get done to improve the app functionality!
- [X] Changed the color of the refresh control to light blue to match the Twitter aesthetics

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Better ways to implement auto layout
2. How to use models to our advantage

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://g.recordit.co/hImZrMGRJs.gif' title='Video Walkthrough of All the Features' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/Zpz29teGPo.gif' title='Liking and Retweeting' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/2QLSRNXv1H.gif' title='Showing Like/Retweet/Post of Composed Tweet on Actual Twitter' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/N5qhgMKRt3.gif' title='Showing From a Different Orientation' width='' alt='Video Walkthrough' />
<img src='http://g.recordit.co/hjZzVj6mcn.gif' title='Logging Out and Logging In' width='' alt='Video Walkthrough' />


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
My biggest challenge was using auto layout. I also had challenges with betting the tweets and profile pictures to load on the timeline.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
