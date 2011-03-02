---
title: Skinny controllers are not enough
tagline: Starve them to death
---

At the end of the day, what do you really want? [Write less code](http://www.google.es/search?q=write%20less%20code). Less code means less bugs and better mantainability, among many other things. 
Nothing new. Something else everyone should be doing (if not doing it already) is to keep fat models and skinny controllers, but keeping your controllers skinny doesn't mean you are not repating yourself. Thus, skinny controllers are not enough.

Enter [Inherited resource](https://github.com/josevalim) ([corresponding Railscast](http://railscasts.com/episodes/230-inherited-resources)). In an ideal world, a typical RESTful post controller would become something like this:
{% code ruby %}
{% caption 'Inherited Resources controller' %}
class PostsController < InheritedResources::Base  
end 
{% endcode %}

This is controllers on diet. In the long run you'll probably need to change something and add some code, but it's definitely very hepful. If you're using Inherited Resources you should also look at [Responders documentation](https://github.com/plataformatec/responders) and then tweak you locales accordingly.

I've always been a fan of Inherited Resources, but recently ([thanks to this tweet by @pat](https://twitter.com/oriolgual/status/40289136208384000)) I discovered [Decent Exposure](https://github.com/voxdolo/decent_exposure), and I really like it. Is a shift from what Inherited Resources does, tackling the problem with a different solution:

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

It is not as DRY as Inherited Resources, but maybe this is a good thing: there's no hidden *voodoo* that magically does everything. It's not that Inherited Resources does something wrong, but sometimes you want more control on what is happening in your application or, due to the lack of knowledge, you're doing something wrong with it but you fail to realize it was due to all the magic happening behind the scenes.

I'd really like to share some experiences about both Inherited Resources and Decent Exposure? Which one do you prefer? What has been your experience so far? Has anyone tried, if it makes sense, to use Decent Exposure together with Responders?
