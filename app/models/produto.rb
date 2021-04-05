class Produto < ApplicationRecord
    validates :nome, presence: true, uniqueness: true
    validates :valor, presence: true

    def to_s
        self.nome
    end
end
