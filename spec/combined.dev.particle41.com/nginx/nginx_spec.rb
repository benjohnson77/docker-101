require 'spec_helper'

describe "dockerdemo_nginx" do
  before(:all) do
    connect_to("dockerdemo_nginx")
  end

  %w{nginx nano python-setuptools curl}.each do |package|
    context package("#{package}") do
      it { should be_installed }
    end
  end

  context service('nginx') do
    it { should be_enabled }
    it { should be_running }
  end

  context port(80) do
    it { should be_listening }
  end

  context port(443) do
    it { should be_listening }
  end

  context host('php-fpm') do
    it { should be_reachable.with( :port => 9000 ) }
  end
end
