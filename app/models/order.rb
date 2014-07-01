require "bluepay"

class Order < ActiveRecord::Base
  belongs_to :event
  has_one :billing_address, class_name: "Address"
  has_one :shipping_address, class_name: "Address"
  has_and_belongs_to_many :event_purchase_options

  accepts_nested_attributes_for :billing_address, :shipping_address

  validates :email, :phone_number, :event_purchase_options, :credit_card_name, :credit_card_number, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_security_code, presence: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  # before_create :purchase

  attr_accessor :credit_card_name, :credit_card_number, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_security_code

  def price
    total = Money.new(0)
    event_purchase_options.each do |option|
      total += option.price
    end
    total
  end

  # private

  # def purchase
  #   mode = Rails.env.development? ? "TEST" : "LIVE"
  #   payment = BluePay.new(ENV["MERCHANT_ACCOUNT_ID"], ENV["MERCHANT_ACCOUNT_SECRET"], mode)

  #   payment.set_cc_information(credit_card_number.tr(" ", ""), "#{credit_card_expiration_month}#{credit_card_expiration_year[2,2]}", credit_card_security_code)

  #   payment.set_customer_information(
  #     billing_address.first_name,
  #     billing_address.last_name,
  #     billing_address.address_1,
  #     billing_address.city,
  #     billing_address.state,
  #     billing_address.zip,
  #     billing_address.address_2,
  #     billing_address.country)

  #   payment.set_phone(phone_number.tr(" ()", ""))
  #   payment.set_email(email)
  #   payment.sale(price.to_s)

  #   binding.pry

  #   response = payment.process()

  #   if (payment.get_status() == "APPROVED") then
  #     puts "TRANSACTION STATUS: " + payment.get_status()
  #     puts "TRANSACTION MESSAGE: " + payment.get_message()
  #     puts "TRANSACTION ID: " + payment.get_trans_id()
  #     puts "AVS RESPONSE: " + payment.get_avs_code()
  #     puts "CVV2 RESPONSE: " + payment.get_cvv2_code()
  #     puts "MASKED PAYMENT ACCOUNT: " + payment.get_masked_account()
  #     puts "CARD TYPE: " + payment.get_card_type()
  #     puts "AUTH CODE: " + payment.get_auth_code()
  #   else
  #     errors.add(:credit_card, payment.get_message())
  #   end
  # end
end
