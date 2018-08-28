class CreateServiceResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :service_responses do |t|
      t.string :name, null: false, comment: 'API name'
      t.string :endpoint, null: false, comment: 'API endpoint'
      t.string :action, null: false, comment: 'Endpoint action'
      t.string :params, null: false, comment: 'Request params'
      t.string :sha1, null: false, comment: 'Hash of the response'

      t.timestamps
    end
  end
end
