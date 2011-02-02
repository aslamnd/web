require 'spec_helper'

describe User do
  it { should respond_to(:email, :password, :password_confirmation) }
  it { should have_many(:posts) }
end
