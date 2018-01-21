require 'csv'

class CsvOutput
  attr_reader :klass, :records

  def initialize(klass, records)
    @klass = klass
    @records = records
  end

  def write_to_file
    CSV.open("test.csv", "w") do |csv|
      csv << klass.csv_header
      records.each { |record| csv << record.to_csv }
    end
  end
end
