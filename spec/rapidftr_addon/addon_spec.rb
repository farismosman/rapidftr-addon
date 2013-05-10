require 'spec_helper'

describe RapidftrAddon::Addon do
  class DummyAddon
    extend RapidftrAddon::Addon
  end

  class DummyAddonImpl < DummyAddon
    def self.addon_id
      :dummy_addon_impl
    end
  end

  it 'default name method should raise Not Implemented error' do
    lambda { DummyAddon.addon_id }.should raise_error("Not Implemented")
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

  it 'should return addon id' do
    DummyAddonImpl.addon_id.should == :dummy_addon_impl
  end

  it 'should find enabled addon by name' do
    DummyAddonImpl.stub! :enabled? => true
    DummyAddon.find_by_addon_id(:dummy_addon_impl).should == DummyAddonImpl
  end

  it 'should not find disabled addon by name' do
    DummyAddonImpl.stub! :enabled? => false
    DummyAddon.find_by_addon_id(:dummy_addon_impl).should == nil
  end

  it 'should not mix enabled between two classes' do
    addon2 = Class.new(DummyAddon)
    DummyAddonImpl.enable
    addon2.should_not be_enabled
  end
end
