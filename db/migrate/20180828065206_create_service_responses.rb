class CreateServiceResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :service_responses do |t|
      t.string :name, comment: 'API name'
      t.string :endpoint, comment: 'API endpoint'
      t.string :action, comment: 'Endpoint action'
      t.string :params, comment: 'Request params'
      t.string :sha1, comment: 'Hash of the response'

      t.timestamps
    end
  end
end
