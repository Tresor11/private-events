# frozen_string_literal: true

class AddLocationColumnsToEventsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :location, :string
  end
end
