class AddProjectRefToTickets < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :project, foreign_key: true
  end
end
