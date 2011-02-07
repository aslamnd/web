require 'spec_helper'

describe UserToken do
  it { should respond_to(:uid, :provider) }
  it { should belong_to(:user) }
end
