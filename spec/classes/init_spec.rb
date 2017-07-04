require 'spec_helper'

describe 'tinyproxy', :type => 'class' do
  context 'with defaults for all parameters' do
    let(:facts) do { 
      :osfamily => 'Debian',
    }
    end
    it do
      should contain_class('tinyproxy')
      should contain_class('tinyproxy::install')
      should contain_class('tinyproxy::config')
      should contain_class('tinyproxy::service')
    end

    it do
      should compile.with_all_deps
    end
  end
  
end