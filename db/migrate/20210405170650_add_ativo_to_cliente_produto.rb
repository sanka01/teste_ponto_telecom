class AddAtivoToClienteProduto < ActiveRecord::Migration[5.2]
  def change
    add_column :clientes, :ativo, :boolean
    add_column :produtos, :ativo, :boolean

  end
end
