require "csv"

CSV.foreach('/Users/satouhiroshi/projects/fleamarket_sample_80b/db/UserSampleData.csv') do |row|

  User.create(:nickname => row[0], :email => row[1], :password => row[2])

end