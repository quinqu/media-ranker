require 'csv'

WORK_FILE = Rails.root.join('db', 'data_seeds', 'works-seeds.csv')

work_failures = []

CSV.foreach(WORK_FILE, :headers => true) do |row|
  work = Work.new

 
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.year = row['publication_year']
  work.description = row['description']

  successful = work.save
  

  if !successful
    work_failures << work
    puts "Failed to save media: #{work.inspect}"
  else
    puts "Created media: #{work.inspect}"
  end

end

puts "Added #{Work.count} media records"
puts "#{work_failures.length} media failed to save"

puts "Manually resetting PK sequence on each table"

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end