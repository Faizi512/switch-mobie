class CreateShareDomains < ActiveRecord::Migration[6.0]
  def change
    return if Rails.env.production?
    create_table :share_domains do |t|
      t.string :url
    end
  end
end
