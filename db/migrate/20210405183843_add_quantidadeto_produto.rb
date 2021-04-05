class AddQuantidadetoProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :produtos_pedidos, :quantidade, :integer

  end
end
