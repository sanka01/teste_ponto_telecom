class Produto < ApplicationRecord
    validates :nome, presence: true, uniqueness: true
    validates :valor, presence: true
end
