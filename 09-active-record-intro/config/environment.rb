require 'bundler/setup'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', # MySQL, Oracle, Postgres { :adapter => 'sqlite3 }
  database: "db/development.sqlite"
)

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'hero', 'heroes'
end

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'

# class ActiveRecord
#   class Base
#     def self.establish_connection(adapter:, database:)
#     end
#   end
# end