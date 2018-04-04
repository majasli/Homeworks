class CreateHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :address

      t.timestamps
    end
  end
end



# You can think of each migration as being a new 'version' of the
# database. A schema starts off with nothing in it,
# and each migration modifies it to add or remove tables, columns, or entries.
# Active Record knows how to update your schema along this timeline,
# bringing it from whatever point it is in the history to the latest version. Active Record will also update your db/schema.rb file to match the up-to-date structure of your data


# This migration adds a table called people with a string
# column called name and an integer column called house_id.
# A primary key column called id will also be added implicitly,
# as it's the default primary key for all Active Record models.
# The timestamps macro adds two columns, created_at and updated_at.
# These special columns are automatically managed by Active Record if they exist.
