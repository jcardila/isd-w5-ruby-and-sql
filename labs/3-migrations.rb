# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-migrations.rb

# **************************
# Don't change or move
Activity.destroy_all
# **************************

# Add new Activity model with database table

# 1. in terminal, run:
# rails generate model Activity

# 2. open newly generated files

# 3. add relevant columns to the db/migrate file

# 4. execute the migration file. in terminal, run:
# rails db:migrate

# Activity is the join model between Salesperson and Contact
# Add the relevant associations to the models.

# 5. Insert at least 2 activities into the activities table
puts Activity.all.count

brian = Salesperson.where({ first_name: "Brian" })[0]
tim = Contact.where({first_name: "Tim"})[0]
activity = Activity.new
activity.salesperson_id = brian.id
activity.contact_id = tim.id
activity.note = "Presentacion de propuesta"
activity.save

puts Activity.all.count

brian = Salesperson.where({ first_name: "Brian" })[0]
elon = Contact.where({first_name: "Elon"})[0]
activity = Activity.new
activity.salesperson_id = brian.id
activity.contact_id = elon.id
activity.note = "Revisar cotizacion"
activity.save

puts Activity.all.count

# 6. Loop through the salespeople and display their activites and related contacts, e.g.:

# ---------------------------------
# Brian Eng
# Grabbed tacos - Tim Cook
#
# Ben Block
# Liked a tweet - Elon Musk

salespeople = Salesperson.all
for salesperson in salespeople
    puts "#{salesperson.first_name} #{salesperson.last_name}"
    activites = salesperson.activities
    for activity in activites
        puts "#{activity.note} - #{activity.contact.first_name} #{activity.contact.last_name}"
    end

    puts ""
end