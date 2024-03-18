class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :order
  has_many :invoice_items, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true
end
 