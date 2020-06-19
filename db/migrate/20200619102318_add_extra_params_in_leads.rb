class AddExtraParamsInLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :delivery_name, :string
  end
end
