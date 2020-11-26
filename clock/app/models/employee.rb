class Employee < ApplicationRecord
  has_many :reports
  serialize :work_days
  validates :name, presence: true, length: { minimum:1 }, format: { with: /([A-Za-z áéíóúÁÉÍÓÚ]{2,48})\w+/i }
  validates :nip, presence: true, format: { with: /([0-9])\w+/i }
  validates :address, presence: true, format: { with: /([a-zA-Z0-9# ])\w+/i }
  validates :phone, presence: true, length: { minimum: 7 }, format: { with: /([+()0-9])\w+/i, message: "You can only use numbers, parentheses and + sign"}
  validates :work_days, presence: true
  validates_each :work_days do |record, attr, value|
    record.errors.add attr, 'Must have at least one checked' if value.length < 1
  end
end
