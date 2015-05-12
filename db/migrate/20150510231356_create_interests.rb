class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.belongs_to :user
    	t.text :interests
    end
  end
end
