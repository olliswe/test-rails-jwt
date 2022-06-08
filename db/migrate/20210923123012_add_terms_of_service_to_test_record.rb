class AddTermsOfServiceToTestRecord < ActiveRecord::Migration[6.1]
  def change
    add_column :test_records, :terms_of_service, :boolean, default: false
  end
end
