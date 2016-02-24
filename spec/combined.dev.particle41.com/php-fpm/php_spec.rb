require 'spec_helper'

describe "dockerdemo_php" do
  before(:all) do
    connect_to("dockerdemo_php")
  end

  %w{autoconf file g++ gcc make re2c curl librecode0 libsqlite3-0 libxml2}.each do |package|
    context package("#{package}") do
      it { should be_installed }
    end
  end

  context service('php-fpm') do
    it { should be_running }
  end

  context port(9000) do
    it { should be_listening }
  end

  context host('mysql') do
    it { should be_reachable.with( :port => 3606 ) }
  end
end
