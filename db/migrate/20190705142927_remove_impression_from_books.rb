class RemoveImpressionFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :impression, :text
  end
end
