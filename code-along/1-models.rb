# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner code-along/1-models.rb

# **************************
# Don't change or move
Company.destroy_all
# **************************

# 1a. check out the schema file
# >sqlite3 db/development.sqlite3
# >.schema
# 1b. check out the model file

puts "There are #{Company.all.count} companies" #get count of rows in table Company
# 2. create new companies
values = { 
    name: "Apple", 
    url: "https://apple.com", 
    city: "Cupertino", 
    state: "CA"
}
company = Company.new(values)
company.save
puts "There are #{Company.all.count} companies"

values = { 
    name: "Amazon", 
    url: "https://amazon.com", 
    city: "Seattle", 
    state: "WA"
}
company = Company.new(values)
company.save
puts "There are #{Company.all.count} companies"

#other way to add data, usefull to change a specific value
company = Company.new
# company.write_attribute(:name, "Tesla")
company.name = "Tesla"
# company.write_attribute(:url, "https://tesla.com")
company.url = "https://tesla.com"
# company.write_attribute(:city, "Palo Alto")
company.city = "Palo Alto"
# company.write_attribute(:state, "CA")
company.state = "CA"
company.save
puts "There are #{Company.all.count} companies"

# 3. query companies table
puts "Consulta 1:"
puts Company.all.inspect

puts "Consulta 2:"
companies = Company.where({ state: "CA" })
puts companies.inspect

#para ver el log de lo que está realmente consultando a la base de datos
#cat log/development.log

apple = Company.where({ state: "CA", name: "Apple" })[0]
puts "Consulta 3:"
puts apple.inspect

# 4. read column values from row

# 5. update attribute value
