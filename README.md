# Smart Twits

[![Code Climate](https://codeclimate.com/github/andyg72/smart_twits/badges/gpa.svg)](https://codeclimate.com/github/andyg72/smart_twits)  [![Test Coverage](https://codeclimate.com/github/andyg72/smart_twits/badges/coverage.svg)](https://codeclimate.com/github/andyg72/smart_twits)

This project was a three day exercise ("Makerthon") as part of the Makers Academy Web Development Bootcamp.

###Makeathon Team:
- Andy Newman [(@andyg72)](https://github.com/andygnewman)
- Bibiana Cristofol [(@BibianaC)](https://github.com/BibianaC)
- Emily Sas [(@emilysas)](https://github.com/emilysas)
- Marcin Walendzik [(@marcinwal)](https://github.com/marcinwal)
- Richard Ighodaro [(@iggyster3)](https://github.com/iggyster3)

##Top Level User Story
- As a time pressed, new hungry individual
- I want to understand the meaning behind Twitter's top trends

<div align="center">
  <img width="90%" src="Smart_Twits_Screen_Shot.png">
</div>

##Solution
SmartTwits aims to provide users with information about currently trending tweets with a view to shedding a little light on the context of the trend. It displays the top ten trending tweets on the left hand side, and upon users clicking these, provides details of:

* the most frequently occuring words within the trending tweets
* the trending tweets that have the most retweets
* the most frequently occuring mentions within the trending tweets
* the trending tweets from users with the most followers
* trending tweets that originated from media organisations

##My Changes
Following the Makeathon I decided to try to make the front-end design a little cleaner. I incorporated bootstrap and tried to give the page as clean a feel as possible - not an easy job for an app that has so much text. The design still needs work, but currently looks like this:

<div align="center">
  <img width="90%" src="Screenshot.png">
</div>

##Refactoring Process
I have been working to refactor the API code. This is now much more concise, but it still needs a drastic reworking. I am looking into how I might use a design pattern such as the Strategy Pattern to achieve this.

##Future Intentions
Having revisited the code following the makeathon, I realised that the classes need rethinking. I would like to redesign the backend logic as well as refactor the code that speaks to the API. I hope to try to use design patterns where relevant.

###Components
The solution has two key elements;
- a back end, that can operate on a set schedule (defaulted to 10 minutes), that retrieves the top trends and gathers associated information and writes it to flat files.
- a front end, that manipulates and presents the information to the user.

##How to run the app

###Creating data
Before running any queries against the Twitter API, you will need to have set up credentials with Twitter.
These then need to be stored in a credentials.md file in the root of the repository, with the following structure;
<p>Consumer_Key(API_Key):xxxxxxxxx</p>
<p>Consumer_Secret(API_Secret):xxxxxxxx</p>
<p>Access_Token:xxxxxxxxx</p>
<p>Access_Token_Secret:xxxxxxxxxx</p>

####On a scheduled
(section to be completed)

####As a one off exercise
$ enter IRB
- require './lib/api_twit'
- update = APITwitter.new
- update.refresh_all_twitter_data

###Running the front end
$ rackup
- open http://localhost:9292/
- Then click on any of the top trends on the left hand side and the information will update.

