class Call < ActiveRecord::Base
	
	require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      call_hash = row.to_hash
      call = Call.where(id: call_hash["id"])

      if call.count == 1
        call.first.update_attributes(call_hash)
      else
        Call.create!(call_hash)
      end
    end
  end

end
