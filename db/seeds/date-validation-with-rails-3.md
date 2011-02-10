Since the first Rails 3 versions came out, we've been playing and using it with new projects. In one of these projectes we needed to validate that a date was before or after, so looking at [rails guides](http://guides.rails.info/3_0_release_notes.html#validations) and [some](http://thelucid.com/2010/01/08/sexy-validation-in-edge-rails-rails-3/) [posts](http://lindsaar.net/2010/1/31/validates_rails_3_awesome_is_true) we coded our first Rails 3 validator.
#Introducing date_validator

As you can read in the [Github repo](http://github.com/codegram/date_validator) description, this is a very simple date validator. To install it:

    gem sources -a http://rubygems.org # If you haven't done it before
    gem install date_validator

Or to make it work with Bundler, in your Gemfile:

{% code ruby %}
gem 'date_validator'
{% endcode %}

Its only dependency is [ActiveModel](http://github.com/rails/rails/tree/master/activemodel), so you can use it either in Rails 3 models or in any custom class (after requiring ActiveModel), in a really easy manner:

{% code ruby %}
validates :expiration_date, :date => { :after => Time.now, :before => Time.now + 1.year }
{% endcode %}

For now these are the available options you can use:

{% code ruby %}
:after
:before
:after_or_equal_to
:before_or_equal_to
{% endcode %}

Pretty much self-explanatory!

##Don't forget the tests: remarkable_date_validator

And last but not least, if you use [Remarkable](http://github.com/carlosbrando/remarkable) (specifically [the Rails 3 fork](http://github.com/hosh/remarkable)) also install the [gem with remarkable matchers](http://github.com/codegram/remarkable_date_validator/):

    gem install remarkable_date_validator

And in your model specs:

{% code ruby %}
should_validate_date_of :expiration_date, :date => {:after => Time.now, :before => Time.now + 1.year}
{% endcode %}

Anyone fancies forking the project and adding some [shoulda](http://github.com/thoughtbot/shoulda) matchers?
