require 'mysql2'
require_relative 'models/item'
require_relative 'models/category'

# def create_db_client
#     client = Mysql2::Client.new(
#         :host => "localhost",
#         :username => ENV["DB_USERNAME"],
#         :password => ENV["DB_PASSWORD"],
#         :database => ENV["DB_NAME"]
#     )
#     client
# end

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "root",
        :password => "",
        :database => "food_oms_db"
    )
    
    client
end

