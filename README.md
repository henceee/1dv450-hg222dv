# 1dv450-hg222dv



##Getting started with the peer review.

10 quick steps to test the sourcecode, I would recomend simply creating a new CUSTOM workspace on Cloud 9.

1. Creating a new CUSTOM workspace on Cloud 9.
2. In the console execute: gem install rails
3. In the console execute: rails new hg222dv-1dv450        (or whatever you choose to call it)
4. Go to file=> Upload local files
5. Drag and drop the CONTENTS of 1dv405-Webbramverk\Registration-App\reg--1dv450\workspace\reg1dv450 from the forked/downloaded repo.
6. Navigate into the folder by exec. in the command line of C9: cd hg222dv-1dv450
7. Execute in the command line: bundle install
8.Execute in the command line: rake db:migrate
9.Execute in the command line: rake db:setup
10.Execute in the command line: $ rails s -p $PORT -b $IP

There, now you're all set to run the app, scavage the source code, what ever you need to do!

##For testing of the API
I used cURL rather than postman, checkout curl.txt
