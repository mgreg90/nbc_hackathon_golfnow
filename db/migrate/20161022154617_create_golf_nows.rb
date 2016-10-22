class CreateGolfNows < ActiveRecord::Migration[5.0]
  def change
    create_table :golf_nows do |t|

      t.timestamps
    end
  end
end
