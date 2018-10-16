require 'rails_helper'

RSpec.describe DonationsController, type: :controller do
  let(:valid_attributes) do
    {
      contact_name: 'Kapcsolat Tartó',
      contact_phone: '+36 90 5555555',
      source_name: 'Kajagyár Kft.',
      source_address: '1111 Budapest, Valahol út 1.',
      food_type: 'Bread',
      available_from: '2017-11-03 14:30',
      available_to: '2017-11-03 16:30',
      quantity: 51,
      not_perishable: true
    }
  end

  let(:invalid_attributes) do
    {
      quantity: 13
    }
  end

  let(:valid_session) { {} }

  let(:user) { create :user }
  let(:notifiable_users) { create_list(:user, 2) + [user] }
  let(:non_notifiable_users) { create_list :user, 2, email_notification: false }
  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      donation = create :donation
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      donation = create :donation
      get :show, params: {id: donation.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      subject(:create_donation) { post :create, params: {donation: valid_attributes}, session: valid_session }

      it "creates a new Donation" do
        expect { create_donation }.to change(Donation, :count).by(1)
      end

      it "saves user_id on the new Donation" do
        expect { create_donation }.to change(user.donations, :count).by(1)
      end

      it "sends email notification to all users who have email notifications enabled" do
        email = double 'email'
        expect(email).to receive(:deliver_later).thrice
        notifiable_users.each { |u| expect(DonationMailer).to receive(:created_notification).with(anything, u).and_return email }
        non_notifiable_users.each { |u| expect(DonationMailer).to_not receive(:created_notification).with(anything, u) }

        create_donation
      end

      it "redirects to the created donation" do
        create_donation
        expect(response).to redirect_to(thank_you_donations_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {donation: invalid_attributes}, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    let(:donation) { create :donation, user: user }

    it "destroys given donation" do
      delete :destroy, params: {id: donation.to_param}, session: valid_session
      expect { donation.reload }.to raise_exception ActiveRecord::RecordNotFound
    end

    it "redirects to current user's donations" do
      delete :destroy, params: {id: donation.to_param}, session: valid_session
      expect(response).to redirect_to(my_donations_path)
    end
  end

end
