require 'spec_helper'
describe 'docker_registry' do

  context 'with defaults for all parameters' do
    it { should contain_class('docker_registry') }
  end
end
