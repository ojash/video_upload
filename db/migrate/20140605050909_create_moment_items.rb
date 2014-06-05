class CreateMomentItems < ActiveRecord::Migration
  def change
    create_table :moment_items do |t|
      t.string :title
      t.string :video
      t.string :audio

      t.timestamps
    end
  end
end
