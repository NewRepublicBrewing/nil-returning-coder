nil-returning-coder
===================

This gem supplies an YAMLColumn coder that returns nil instead of a blank object.  Useful when the class you are serializing to/from does not allow uninitialized objects (such as a unit measurement)

Why?
====

Suppose you have this:

````ruby
class Sandwich < ActiveRecord::Base
  attr_accessible :length
  serialize :length, Unit
end
````

This happens:

    2.0.0-p247 :002 > Sandwich.new
    ArgumentError: Invalid Unit Format

Because ActiveRecord is trying to do this:

    2.0.0-p247 :003 > Unit.new
    ArgumentError: Invalid Unit Format

So in `config/initializers/ruby-units.rb`

````ruby
Unit.instance_eval do
  include NilReturningCoder
end
````

Now your shit works

    2.0.0-p247 :002 > Sandwich.new
     => #<Sandwich id: nil, length: nil> 

