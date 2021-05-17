require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe "ActiveRecord associations" do
    it { should have_many :schedules }
    it { should accept_nested_attributes_for :schedules }
  end
end
