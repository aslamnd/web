---
title: Skinny controllers are not enough
tagline: CRUD FTW
---

At the end of the day, what do you really want? [Write less code](http://www.google.es/search?q=write%20less%20code). Less code means less bugs and better mantainability, among many other things. 
Nothing new ATM. another best practice is to keep your models fat and your controllers skinny, it something almost everyone is (or should be doing) currently doing. But keeping your controllers skinny doesn't mean you are not repating yourself.

Enter [Inherited resource](https://github.com/josevalim) and [Decent Exposure](https://github.com/voxdolo/decent_exposure). What they do is change a RESTful controller to just this:
http://railscasts.com/episodes/230-inherited-resources

{% code ruby %}
{% caption 'Inherited Resources controller' %}
class PostsController < InheritedResources::Base  
end 
{% endcode %}

{% code ruby %}
{% caption 'Decent Exposure controller' %}
class PostsController < ApplicationController
  expose(:post)

  def create
    post.save
    respond_with(post)
  end

  def update
    post.update_attributes(params[:post])
    respond_with(post)
  end

  def destroy
    post.destroy
    respond_with(post)
  end
end 
{% endcode %}

At first glance, is obvious that with *Inherited Resources* you can avoid even writing a single line of code (although in the long run you'll probably need to), but it's normal, each one is a different solution (and not necessary to the same problem).

+ Skinny controllers, example PostsController
+ inherited_resources controller
+ decent_exposure controller

+ Showdown
+ Inherited resource more magical
+ Comes with responders (bonus)
+ Always fan of inherited resource, just discovered decent exposure and really
like it
+ Less magic an also be good
+ resource, collection VS expose
+ belongs_to VS associated
+ With decent exposure you still need to define create, update and destroy

+ Try to integrate decent exposure with responders (makes sense?)
+ Feedback
