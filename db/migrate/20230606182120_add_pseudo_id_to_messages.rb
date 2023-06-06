class AddPseudoIdToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :pseudo_id, :integer
  end
end
