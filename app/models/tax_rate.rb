class TaxRate < ActiveRecord::Base
  belongs_to :state
  belongs_to :category
end
