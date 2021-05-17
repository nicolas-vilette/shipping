class Shop < ApplicationRecord
  has_many :schedules, dependent: :delete_all
  accepts_nested_attributes_for :schedules, allow_destroy: true

end
