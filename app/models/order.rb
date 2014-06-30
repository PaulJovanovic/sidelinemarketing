class Order < ActiveRecord::Base
  belongs_to :event
  has_one :billing_address, class_name: "Address"
  has_one :shipping_address, class_name: "Address"
  has_and_belongs_to_many :event_purchase_options

  accepts_nested_attributes_for :billing_address, :shipping_address

  validates :email, :phone_number, :event_purchase_options, :credit_card_name, :credit_card_number, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_security_code, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  attr_accessor :credit_card_name, :credit_card_number, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_security_code

  def price
    total = Money.new(0)
    event_purchase_options.each do |option|
      total += option.price
    end
    total
  end
end
