class Store < ApplicationRecord
  validates :name, presence: true, format: { with: /([a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48})/i }
  validates :phone, presence: true, length: { minimum: 7 }, format: { with: /([+()0-9])\w+/i, message: "You can only use numbers, parentheses and + sign"}
  validates :address, presence: true, format: { with: /([a-zA-Z0-9#])\w+/i, message: "You can only use letters, numbers and the # sign"}
end
