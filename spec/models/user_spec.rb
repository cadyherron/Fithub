require 'rails_helper'

describe User do

  let(:user) { create(:user) { include Searchable } }

  context 'Searchable' do

    it "returns result when search is successful" do
      user
      expect(User.search("Foo").length).to eq(1)
    end

    it "returns empty when search is unsuccessful" do
      user
      expect(User.search("z").length).to eq(0)
    end

    it "returns all users when search is empty" do
      3.times { create(:user) }
      expect(User.search("").length).to eq(3)
    end

  end



end


