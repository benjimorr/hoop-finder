require 'rails_helper'

RSpec.describe User, type: :model do
    let(:user) { create(:user) }

    # Shoulda tests for first_name
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_length_of(:first_name).is_at_least(2) }

    # Shoulda tests for last_name
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_length_of(:last_name).is_at_least(2) }

    # Shoulda tests for username
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(5) }

    # Shoulda tests for email
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    it { is_expected.to validate_length_of(:email).is_at_least(3) }
    it { is_expected.to allow_value("user@wikipages.com").for(:email) }

    # Shoulda tests for password
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }

    describe "attributes" do
        it "should have first_name attribute" do
            expect(user).to have_attributes(email: user.first_name)
        end

        it "should have last_name attribute" do
            expect(user).to have_attributes(email: user.last_name)
        end

        it "should have username attribute" do
            expect(user).to have_attributes(email: user.username)
        end

        it "should have email attribute" do
            expect(user).to have_attributes(email: user.email)
        end

        it "responds to skill_level" do
            expect(user).to respond_to(:skill_level)
        end

        it "responds to beginner?" do
            expect(user).to respond_to(:beginner?)
        end

        it "responds to intermediate?" do
            expect(user).to respond_to(:intermediate?)
        end

        it "responds to advanced?" do
            expect(user).to respond_to(:advanced?)
        end

        it "responds to legendary?" do
            expect(user).to respond_to(:legendary?)
        end
    end

    describe "skill_level" do
        it "is beginner by default" do
            expect(user.skill_level).to eq("beginner")
        end
    end

    describe "invalid user" do
        let(:user_with_invalid_email) { build(:user, email: "") }

        it "should be an invalid user due to blank email" do
            expect(user_with_invalid_email).to_not be_valid
        end
    end
end
