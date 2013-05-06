require 'spec_helper'

describe RapidftrAddons::Addon do
  class DummyAddon
    extend RapidftrAddons::Addon
  end

  class DummyAddonImpl < DummyAddon
  end

  it 'should have name' do
    lambda {
      DummyAddon.name
    }.should raise_error("Not Implemented")
  end

  it 'should have enabled?' do
    DummyAddon.should be_enabled
  end

  it 'should list enabled implementations' do
    DummyAddon.implementations.should == [ DummyAddonImpl ]
  end

  it 'should not list disabled implementations' do
    DummyAddonImpl.stub! :enabled? => false
    DummyAddon.implementations.should be_empty
  end
end
