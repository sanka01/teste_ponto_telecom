class Cliente < ApplicationRecord
    validates :nome, presence: true, uniqueness: { case_sensitive: false }
    validates :telefone, presence: true, uniqueness: true
    validates :data_nascimento, presence: true

    def to_s
        self.nome
    end
end
