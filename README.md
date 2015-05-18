# robot-test
Some kind of implementation of the (in)famous robot test

Written with ruby 2.1.2p95 because that's what was available on my laptop at the time.

To run:

bundle install
bundle exec ruby -I lib/ main.rb

Specs:

bundle exec rspec

Once running, you may run the following commands from the command line (don't worry about case, upper or lower is fine):

PLACE X Y [NORTH|SOUTH|EAST|WEST] (where 0 >= X,Y <= 4)
LEFT
RIGHT
MOVE
REPORT
