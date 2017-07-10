class CreateShorteneds < ActiveRecord::Migration[5.1]
  def change
    create_table :shorteneds do |t|
      t.text :in_url
      t.integer :http_status

      t.timestamps
    end
  end
end
