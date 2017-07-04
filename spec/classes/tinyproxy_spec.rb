require 'spec_helper'

describe 'tinyproxy', :type => 'class' do
  context "on windows" do
    let(:facts) do { 
      :osfamily => 'windows',
    }
    end
    it do
      expect {
      catalogue
      }.to raise_error(Puppet::Error, /Unsupported osfamily/)
    end
  end
  context "on Solaris" do
    let :facts do {
        :osfamily => 'Solaris'
      }
    end
    it do
      expect {
       catalogue
      }.to raise_error(Puppet::Error, /Unsupported osfamily/)
    end
  end
  context "on OSX" do
    let :facts do {
        :osfamily => 'Darwin'
      }
    end
    it do
      expect {
       catalogue
      }.to raise_error(Puppet::Error, /Unsupported osfamily/)
    end
  end
end