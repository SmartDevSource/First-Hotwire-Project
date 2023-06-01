class AddInfosToEmails < ActiveRecord::Migration[7.0]
  def change
    add_column :emails, :object, :string
    add_column :emails, :body, :text
  end
end
