json.extract! report_item, :id, :amount, :report_id, :created_at, :updated_at
json.url report_item_url(report_item, format: :json)
