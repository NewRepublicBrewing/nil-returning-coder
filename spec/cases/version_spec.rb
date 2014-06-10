require 'spec_helper'

describe NilReturningCoder do

  it 'responds to version' do
    NilReturningCoder.should respond_to :version
  end


  it 'gives a version string' do
    NilReturningCoder.version.should be_a String
  end

end
