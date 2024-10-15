class AddSubdomainsCountToDomains < ActiveRecord::Migration[7.1]
  def change
    add_column :domains, :subdomains_count, :integer
  end
end
