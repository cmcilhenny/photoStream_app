require 'spec_helper'

describe Event do
  subject {FactoryGirl.create(:event)}

  it 'should respond to name and event_date' do
    subject.should respond_to(:name)
    subject.should respond_to(:event_date)
  end

  describe 'event_date' do

    it 'should not be empty' do
      event = FactoryGirl.build(:event, event_date: nil)
      event.should_not be_valid
    end

    it 'should not be valid' do
      event = FactoryGirl.build(:event, event_date: "tomorrow")
      event.should_not be_valid
    end

    # it 'should be unique' do
    # TODO: date should only be unique when associated with event name.
    # end
  end

  describe 'name' do

    it 'should not be empty' do
      event = FactoryGirl.build(:event, name: nil)
      event.should_not be_valid
    end

  end

  describe 'user for event' do 

    it 'should have a user' do
      subject.user_id = nil
      subject.should_not be_valid
    end

  end

  describe 'custom_url for event' do

    it 'should not be empty' do
      event = FactoryGirl.build(:event, custom_url: nil)
      event.should_not be_valid
    end

    it 'should be unique in database' do
      event = FactoryGirl.create(:event)
      event2 = FactoryGirl.build(:event, custom_url: event.custom_url)
      event2.should_not be_valid
    end
  end

end
