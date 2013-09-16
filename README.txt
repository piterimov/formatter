formatter README
==================

Dependencies
------------

It requires rvm and ruby 2.0.0 version.

Install RVM:
--------------------
    \curl -L https://get.rvm.io | bash -s stable --ruby

Install Ruby 2.0.0:
--------------------
    rvm install 2.0.0

For Development
--------------------

In folder where you want to keep the project run following commands:
    rvm use 2.0.0@formatter --create

To install pry
    gem install pry
    gem install rb-readline

To install YARD
    gem install yard

To test application
    ruby client.rb