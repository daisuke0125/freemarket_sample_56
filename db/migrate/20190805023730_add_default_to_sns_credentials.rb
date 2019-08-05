class AddDefaultToSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sns_credentials, :uid, false
    change_column_null :sns_credentials, :provider, false
  end
end
