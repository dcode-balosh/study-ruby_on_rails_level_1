class ChangeTotalGrossInMovies < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :total_gross , :decimal
  end
end
