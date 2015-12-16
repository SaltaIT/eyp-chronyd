require 'spec_helper'
describe 'chronyd' do

  context 'with defaults for all parameters' do
    it { should contain_class('chronyd') }
  end
end
