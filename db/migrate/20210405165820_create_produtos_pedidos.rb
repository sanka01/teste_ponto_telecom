class CreateProdutosPedidos < ActiveRecord::Migration[5.2]
  def change
    create_table :produtos_pedidos do |t|
      t.references :produto, foreign_key: true
      t.references :pedido, foreign_key: true
      t.float :valor

      t.timestamps
    end
  end
end
