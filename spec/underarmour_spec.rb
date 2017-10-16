require "spec_helper"
require './spec/stubs/stub_api.rb'

RSpec.describe Underarmour do
  it "has a version number" do
    expect(Underarmour::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(1.equal?(1)).to eq(true)
  end

  describe 'Using an ApiClient allows us to fetch a User' do
    let(:access_token) { 'access_token_returned_from_ua' }
    let(:api_key) {'client_id_provided_by_ua'}

    context '#user' do
      it 'returns user/self' do
        Underarmour::StubApi.scoped_api_client(Underarmour::User, 'user').find_self
        user = Underarmour::ApiClient.scoped_api_client(Underarmour::User, 'user/', access_token: access_token, api_key: api_key).find_self
        expect(user.first_name).to eq 'Oswald'
      end
    end

    context '#privacy_option' do
      xit 'returns a privacy option api response' do
        Underarmour::StubApi.scoped_api_client(Underarmour::PrivacyOption, 'privacy_option').all
        privacy_option = Underarmour::ApiClient.scoped_api_client(Underarmour::PrivacyOption, 'privacy_option/', access_token: access_token, api_key: api_key).all

        aggregate_failures do
          expect(privacy_option.links).to eq({"self"=>[{"href"=>"/v7.1/privacy_option/?limit=20&offset=0"}], "documentation"=>[{"href"=>"https://developer.underarmour.com/docs/v71_Privacy_Option"}]})
          expect(privacy_option.embedded).to eq({ "privacy_options"=> [{"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/0/", "id"=>"0"}]}, "description"=>"Private. Do Not Share"},
                {"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/3/", "id"=>"3"}]}, "description"=>"Public. Share With Everyone"},
                {"_links"=>{"self"=>[{"href"=>"/v7.1/privacy_option/1/", "id"=>"1"}]}, "description"=>"Friends. Share With All My Friends"}]})
          expect(privacy_option.total_count).to eq 3
        end
      end
    end
    
    context '#user_profile_photo' do
      xit 'returns a user_profile_photo as nil' do
        # @TODO: upload pic and then get a real response for this
        Underarmour::StubApi.scoped_api_client(Underarmour::UserProfilePhoto, 'user_profile_photo').all
        user_profile_photo = Underarmour::ApiClient.scoped_api_client(Underarmour::UserProfilePhoto, 'user_profile_photo/', access_token: access_token, api_key: api_key).all
        expect(user_profile_photo.small).to be_nil
      end
    end

    context '#user_role' do
      xit 'returns a user_role with role & a user reference' do
        # @TODO: create an example user role
        Underarmour::StubApi.scoped_api_client(Underarmour::UserRole, 'user_role/').all
        user_role = Underarmour::ApiClient.scoped_api_client(Underarmour::UserRole, 'user_role/', access_token: access_token, api_key: api_key).all
        expect(user_role.resource).to eq {}
      end
    end

    context '#user_stats' do
      xit 'returns an array of stats with aggregation data' do
        # @TODO: create an example user stats
        Underarmour::StubApi.scoped_api_client(Underarmour::UserStats, 'user_stats/').find
        user_stats = Underarmour::ApiClient.scoped_api_client(Underarmour::UserStats, 'user_stats/', access_token: access_token, api_key: api_key).find(112123207)
        expect(user_stats.energy).to eq {}
      end
    end

    context '#activity_type' do
      it 'returns an activity_type' do
        Underarmour::StubApi.scoped_api_client(Underarmour::ActivityType, 'activity_type').find(215)
        activity_type = Underarmour::ApiClient.scoped_api_client(Underarmour::ActivityType, 'activity_type/', access_token: access_token, api_key: api_key).find(215)
        aggregate_failures do
          expect(activity_type.mets).to eq(8.0)
          expect(activity_type.name).to eq("Kickboxing, Machine")
        end
      end
    end

    context '#actigraphy' do
      xit 'returns an actigraphy' do
        # => Underarmour::StubApi.scoped_api_client(Underarmour::Actigraphy, 'actigraphy/').all
        date = Date.new(2017, 07, 07)
        actigraphy = Underarmour::ApiClient.scoped_api_client(Underarmour::Actigraphy, 'actigraphy/', access_token: access_token, api_key: api_key).all(start_date: date)
        binding.pry
        aggregate_failures do
          expect(actigraphy.mets).to eq(8.0)
          expect(actigraphy.name).to eq("Kickboxing, Machine")
        end
      end
    end

    context '#aggregate' do
      xit 'returns an aggregate' do

      end
    end
    context '#allday_activity_timeseries' do
      xit 'returns an allday_activity_timeseries' do

      end
    end
    context '#allday_activity' do
      xit 'returns an allday_activity' do

      end
    end
    context '#bodymass' do
      xit 'returns a bodymass' do

      end
    end
    context '#sleep' do
      xit 'returns a sleep' do

      end
    end
  end
end
