require 'rails_helper'
require 'spec_helper'

RSpec.describe Schedule, type: :model do
  describe "ActiveRecord associations" do
    it { should belong_to :shop }
  end
end
