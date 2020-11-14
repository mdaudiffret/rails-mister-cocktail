class AddCheersVoteToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :cheers_vote, :integer
  end
end
