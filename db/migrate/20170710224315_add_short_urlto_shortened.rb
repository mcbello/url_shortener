class AddShortUrltoShortened < ActiveRecord::Migration[5.1]
  def change
    add_column :shorteneds, :short_url, :string

  end
end
