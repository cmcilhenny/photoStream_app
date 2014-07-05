require 'spec_helper'

describe 'Photos Management' do

#TODO: work through management rspec for nested routes

  before :each do
    @photo = FactoryGirl.create(:photo)
    @event = FactoryGirl.create(:event, name: "Test")
    # @photo_attributes = FactoryGirl.attributes_for(:photo, event_id: 4)
    # ApplicationController.any_instance.stub(:event).and_return(@event.photo)
  end

  describe 'upload photo path' do

    it 'returns 200 status' do
   
      get "/upload/#{@event.id}"
      expect(response.status).to eq(200)
    end

    it 'renders form for upload photo' do
      get "/upload/#{@event.id}"
      expect(response).to render_template(:new)
    end
  end

  describe 'photo streaming path' do

    # it 'returns 200 status' do
    #   get "/events/#{@event.id}/photos"
    #   expect(response).to eq(200)
    # end

    # it 'displays a new photo every 5 seconds' do

    # end

  end

end