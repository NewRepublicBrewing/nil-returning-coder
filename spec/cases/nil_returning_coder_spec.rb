require 'spec_helper'

Blark = Struct.new(:attr) do
  include NilReturningCoder
end

describe NilReturningCoder do

  let(:klass)  { Blark }
  let(:object) { klass.new }
  let(:coder)  { NilReturningCoder::Coder.new }

  shared_examples_for 'a dumper' do
    it 'returns nil when given nil' do
      dumper.dump(nil).should be_nil
    end
    it 'returns yaml when given something' do
      dumper.dump(object).should eq object.to_yaml
    end
  end


  shared_examples_for 'a loader' do
    it 'returns nil when given nil' do
      loader.load(nil).should be_nil
    end
    it 'returns the object when given yaml' do
      loader.load(object.to_yaml).should eq object
    end
  end


  describe :ClassMethods do

    [:dump, :load].each do |meth|
      it "mixes in #{meth}" do
        klass.should respond_to(meth)
      end
    end

    it_behaves_like 'a dumper' do
      let(:dumper) { klass }
    end

    it_behaves_like 'a loader' do
      let(:loader) { klass }
    end

  end

  describe :Coder do

    it_behaves_like 'a dumper' do
      let(:dumper) { coder }
    end

    it_behaves_like 'a loader' do
      let(:loader) { coder }
    end

  end

end
