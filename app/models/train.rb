class Train < ApplicationRecord
  belongs_to :menu, optional: true
  self.inheritance_column = :_type_disabled
end
