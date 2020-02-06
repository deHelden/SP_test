# SP_test

## Task

```
1. ruby_app
    Write a ruby script that:
    a. Receives a log as argument (webserver.log is provided) 
         e.g.: ./parser.rb webserver.log
    b. Returns the following:
        > list of webpages with most page views ordered from most pages views to less page views
            e.g.:
        /home 90 visits /index 80 visits etc... 
        > list of webpages with most unique page views also ordered
            e.g.:
        /about/2 8 unique views /index 5 unique views etc...
```


## Basic setup & run
- Clone this repository to your working directory

`git clone git@github.com:deHelden/SP_test.git`

- Navigate to repository folder

`cd SP_test/`

- Install required gems (aka ruby libraries) with 

`bundle install`
  
- Execute ruby script with:

`ruby parser.rb webserver.log`

#### Rspec

- Run all existing specs with  

`rspec spec/lib/*.rb`

## Notes

#### Architecture & Principles
 - When developing the architecture, I tried to find the most efficient way
  to implement solid in the allotted time.
 
 - The first step was to divide the responsibility between the participants.
  This is how the parser, presenter, and sorter appeared.
  
 - The second step was my attempt to use DRY in my code where it possible.

#### Testing idea
 - Tests will help you understand the main essence of the project - 
 what methods were used, without touching the implementation.
  Which in turn opens up space for refactoring code without
   changing the tests themselves.
  A kind of " black box"

#### "For tomorrow day"
 - Presenter would be good to make more flexible.
   Now it only outputs data to the console. But I think it would be
    a great idea to convert it into a module that would expand,
     thus allowing you to output data in different formats in the future
      ( for a database, a file, a third-party server, etc.).)
 
 - There was an idea to create a Matcher for the webserver.log that
  would check the correctness of the lines supplied by the file.
   We don't really know what this file gives us and believe it blindly.
