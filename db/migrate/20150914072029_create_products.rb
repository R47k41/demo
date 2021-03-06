class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title, limit: 50;
      t.text :description;
      t.string :image_url;
      t.decimal :price, precision: 15, scale: 2;

      t.timestamps null: false;
    end;
  end;
end;
