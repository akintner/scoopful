# Scoopful

[Production Site](https://scoopful.herokuapp.com)

Scoops to Stoop: bringing the bulk aisle right to your front step. User can login to view and check out food items by the pound in a digital grocery store bulk aisle.

Eliminate food waste by ordering as much or as little as you need of an ingredient. 

#### Project Manager 
Amy Kintner
#### Project Members
Mike Schutte, Kyle Heppenstall, Annie Wolff

Tech Stack: Rails, PostgreSQL, RSpec, Sass, Haml, Heroku, Capybara, bcrypt

Follow these steps to run tests or host the site locally.

1. To get started make sure you have postgres, Ruby, and rails 5  (`gem install rails`) installed on your machine.
1. Clone the repository: `git clone https://github.com/kheppenstall/idea_box.git`
1. `cd` into the directory `scoopful` and `bundle install` in the command line.
1. Run `rake db:create`,  `rake db:migrate`, and `rake db:test:prepare` in the command line to get your schema up to date.
1. Run `rspec` in the command line to run the tests.
1. Run `rails s` in the command line to host the site locally and visit http://localhost:3000/ to check it out!
