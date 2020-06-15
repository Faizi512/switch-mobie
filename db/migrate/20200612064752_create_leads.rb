class CreateLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :leads do |t|
      t.integer :lead_id
      t.string :redirect_url
      t.timestamps
    end
  end
end
