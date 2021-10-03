class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :telephone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :block
    validates :telephone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      order = Order.create(item_id: item_id, user_id: user_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, telephone_number: telephone_number, order_id: order.id)
  
    end
end