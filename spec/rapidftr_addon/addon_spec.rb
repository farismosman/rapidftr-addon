require 'spec_helper'

describe RapidftrAddon::Addon do
  class DummyAddon
    extend RapidftrAddon::Addon
  end

  class FooAddon < DummyAddon
    def self.id
      :dummy_addon_impl
    end
  end

  class BarAddon < DummyAddon
    def self.id
      :dummy_addon_impl_2
    end
  end

  it 'default name method should raise Not Implemented error' do
    lambda { DummyAddon.id }.should raise_error("Not Implemented")
  end

  it 'should not be enabled first time' do
    FooAddon.should_not be_enabled
    BarAddon.should_not be_enabled
  end

  it 'should return only enabled addons' do
    FooAddon.stub! :enabled? => true
    DummyAddon.active.should == [ FooAddon ]
  end

  it 'should return all addons' do
    DummyAddon.all.should include(FooAddon, BarAddon)
  end

  it 'should return addon id' do
    FooAddon.id.should == :dummy_addon_impl
  end

  it 'should find enabled addon by name' do
    FooAddon.stub! :enabled? => true
    DummyAddon.find_by_id(:dummy_addon_impl).should == FooAddon
  end

  it 'should not find disabled addon by name' do
    FooAddon.stub! :enabled? => false
    DummyAddon.find_by_id(:dummy_addon_impl).should == nil
  end

  it 'with dynamic class' do
    addon2 = Class.new(DummyAddon)
    addon2.enable
    DummyAddon.active.should == [ addon2 ]
  end

end
