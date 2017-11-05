require 'rails_helper'

RSpec.describe Transport, type: :model do

  it { is_expected.to validate_presence_of(:phone) }

  describe "#valid?" do
    context "when email is not given" do
      subject { Transport.new(name: "John Doe", phone: "+36 90 555 5555").valid? }

      it { is_expected.to eq false }
    end

    context "when email is not valid" do
      subject { Transport.new(email: "notvalid@localhost", name: "John Doe", phone: "+36 90 555 5555").valid? }

      it { is_expected.to eq false }
    end
  end
end
