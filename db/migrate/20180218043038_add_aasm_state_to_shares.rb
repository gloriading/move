class AddAasmStateToShares < ActiveRecord::Migration[5.1]
  def change
    add_column :shares, :aasm_state, :string
  end
end
