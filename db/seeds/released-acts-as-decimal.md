Lately we have been working on some Rails 3 projects where we were handling price attributes. Since prices are naturally floating point variables (12.95, 297.50...) we felt like they had to be treaten like those, but still, in order to avoid precision losses (prices are sensitive, you know!), we wanted to store them as integers in the database.

#Why don't we just make a really simple gem?

Then we came up with this tiny gem, and we are proud to introduce it to our readers! It even might make your developer lives a bit easier :)

The gem is hosted on [Github](http://github.com/codegram/acts_as_decimal) and released also in [Gemcutter](http://rubygems.org/gems/acts_as_decimal), so it is really easy to install and use. It depends only on ActiveRecord 3.0.0.

In your Gemfile:

{% code ruby %}
gem 'acts_as_decimal'
{% endcode %}

Then, in your model:

{% code ruby %}
class Product < ActiveRecord::Base
  acts_as_decimal :price                   # Defaults to 2 decimals, or...
  acts_as_decimal :price, :decimals => 5   # ... as you wish!
end
{% endcode %}

Now you store and retrieve :price as a floating point:

{% code ruby %}
product = Product.new
product.price = 12.30
product.price         # => 12.30 
{% endcode %}

But you still have access to the raw database integer value through :price_raw:

{% code ruby %}
product.price_raw         # => 1230
product.price_raw = 4309  # => product.price == 43.09
{% endcode %}

Furthermore, you get some nice humanizers for free. Note that all humanizers return a string, not a float.

{% code ruby %}
product = Product.new
product.price = 3900400.40
product.humanized_price
# => "3.900.400,40"
product.humanized_price(:thousand_delimiters => false)
# => "3900400.40"
{% endcode %}

We are also planning on developing some Remarkable matchers for this as soon as we can!

And that's all. We hope that you find this useful and, if you feel it lacks any nice feature, we encourage you to contribute! :)
