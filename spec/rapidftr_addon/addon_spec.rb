require 'spec_helper'

describe RapidftrAddon::Addon do
  class DummyAddon
    extend RapidftrAddon::Addon
  end

  class DummyAddonImpl < DummyAddon
  end

  it 'should have name' do
    lambda {
      DummyAddon.name
    }.should raise_error("Not Implemented")
  end

  it 'should not be enabled first time' do
    DummyAddonImpl.should_not be_enabled
  end

  it 'should enable addon' do
    DummyAddonImpl.enable
    DummyAddon.implementations.should include DummyAddonImpl
  end

  it 'should disable addon' do
    DummyAddonImpl.disable
    DummyAddon.implementations.should be_empty
  end
end
