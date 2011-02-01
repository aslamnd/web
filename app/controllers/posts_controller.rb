class PostsController < ApplicationController
  inherit_resources
  actions :index, :show
end
