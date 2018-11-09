class Menu < ApplicationRecord
  has_many :trains, foreign_key: 'menu_id', dependent: :destroy
  accepts_nested_attributes_for :trains
  belongs_to :user, optional:true

end
