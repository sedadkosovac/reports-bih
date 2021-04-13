require 'csv'
class Report < ApplicationRecord
  has_many :report_items, dependent: :destroy

  def sum_amount
    report_items.sum(&:amount)
  end

  def csv_export
    attributes = {
      amount: 'amount'
    }
    ::CSV.generate(headers: true) do |csv|
      csv << attributes.values

      report_items.each do |report_item|
        csv << attributes.keys.map{ |attr| report_item.send(attr) }
      end
      csv << [sum_amount]
    end
  end
end
