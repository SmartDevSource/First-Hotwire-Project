class AddAlreadyOpenedToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :alreadyopened, :boolean
  end
end
