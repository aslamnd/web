----
title: Why Cucumber sucks and I still love it
tagline: 
----

# This sucks:

## Cucumber example:
{% code ruby %}
{% caption 'main_page.feature' %}
  Feature: Main page

    Background:
      Given I have a user with login "jdoe"
      And I login as "jdoe"

    Scenario: Should show existing quotes
      Given a quote exist with text "The language of friendship is not words, but meanings" and author "Henry David Thoreau"
      When I visit the home page
      Then I should see "The language of friendship is not words, but meanings" within ".quote .text"
      And I should see "Henry David Thoreau" within ".quote .author"
{% endcode %}

## Capybara / Steak (does Steak still makes sense?) example:

{% code ruby %}
{% caption 'main_page_spec.rb' %}
  feature "Main page" do

    background do
      create_user :login => "jdoe"
      login_as "jdoe"
    end

    scenario "should show existing quotes" do
      create_quote :text => "The language of friendship is not words, but meanings",
                   :author => "Henry David Thoreau"

      visit "/"

      page.should have_css(".quote", :count => 1)
      within(:css, ".quote") do
        page.should have_css(".text", :text => "The language of friendship is not words, but meanings")
        page.should have_css(".author", :text => "Henry David Thoreau")
      end
    end

  end
{% endcode %}

It sucks because:
* Does not really differ a lot from the Capybara example
* It's a pain in the ass to mantain
* You are not leveraging Cucumber power
* YOU ARE FUCKING WRITING CSS IN YOUR CUKES
* Only devs understand these cukes and specs

The problem is not really Cucumber, nor the steps, is how they are written (both Cucumber and Capybara examples)

# This rocks:

Example from CukeUp
http://cl.ly/66Ne

Another nice example:

{% code ruby %}
{% caption 'withdrawal.feature' %}
  Scenario: Attempt withdrawal using stolen card 
    Given I have $100 in my account 
    But my card is invalid
    When I request $50
    Then my card should not be returned 
    And I should be told to contact the bank

{% endcode%}

{% code ruby %}
{% caption 'withdrawal_test.rb' %}
## TestUnit example:

  class WithdrawlTests < Test::Unit::TestCase
    def test_attempt_widthrawl_using_stolen_card
      given_I_have_$100_in_my_account
      given_I_have_a_stolen_card
      when_I_request_$50
      then_my_card_is_not_returned
      then_I_am_told_to_contact_the_bank
    end
   
    def given_I_have_$100_in_my_account 
      @bank = Bank.new
      @account = Account.new(@bank)
      @account.deposit(100)
    end
   
    def given_I_have_a_stolen_card 
      @card = DebitCard.new(account)
      @bank.lock_out(card)
    end
   
    def when_I_request_$50
      @atm = Atm.new(@bank)
      @atm.insert_card(@card)
      @atm.enter_pin(@card.pin)
      @atm.withdraw(50)
    end
   
    def then_my_card_is_not_returned 
      assert @atm.card_withheld?, "Expected the card to be withheld by the ATM"
    end
   
    def then_I_am_told_to_contact_the_bank
      assert_equal "Please contact the bank.", @atm.message_on_screen
    end
  end
{% endcode%}

# Conclusion

* How many people really write TU this way?
* *I* don't really need all the steps in the very same file
* Cucumber is not only about testing, it is also about documentation, business value and *abstraction*
* Abstraction helps separating features from code
* TU and Capybara don't really promote this kind of separation
* Delete web_steps.rb, just add "http://cheat.errtheblog.com/s/capybara/" to your bookmarks
* Use whatever you want, but use something

# References:

http://skillsmatter.com/podcast/home/refuctoring-your-cukes
http://blog.mattwynne.net/2011/03/30/cucumber-why-bother/
http://blog.mattwynne.net/2011/03/30/cucumber-why-bother/#comment-1277
http://evan.tiggerpalace.com/articles/2011/01/31/cucumber-vs-steak-vs-wtf/
http://jeffkreeftmeijer.com/2010/steak-because-cucumber-is-for-vegetarians/

https://github.com/cavalle/steak
https://github.com/elight/coulda
https://github.com/jnicklas/capybara/commit/f4897f890d8dd33215fef238902988e8823a6539
