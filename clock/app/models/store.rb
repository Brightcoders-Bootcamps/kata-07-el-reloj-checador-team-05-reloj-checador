class Store < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }, format: { with: /([a-zA-ZàáâäãåąčćęèéêëėįìíîïłńòóôöõøùúûüųūÿýżźñçčšžÀÁÂÄÃÅĄĆČĖĘÈÉÊËÌÍÎÏĮŁŃÒÓÔÖÕØÙÚÛÜŲŪŸÝŻŹÑßÇŒÆČŠŽ∂ð ,.'-]{2,48})/i }
  validates :phone, presence: true, format: { with: /([+()0-9])\w+/i, message: "+52(413)1001000"}
end
