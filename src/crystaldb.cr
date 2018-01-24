require "./crystaldb/*"
require "mysql"

# TODO: Write documentation for `Crystaldb`
module Crystaldb
  DB.open "mysql://root@localhost/sparta" do |db|
    db.exec "drop table if exists contacts"
    db.exec "create table contacts (id int(20) NOT NULL AUTO_INCREMENT, email VARCHAR(255), PRIMARY KEY (id))"
    db.exec "insert into contacts values (?, ?)", 0, "hardcode45@yahoo.com"

    db.query "select * from contacts " do |rs|
      puts "#{rs.column_name(0)} #{rs.column_name(1)}"
      rs.each do
        puts "#{rs.read(Int32)} #{rs.read(String)}"
      end
    end
  end
end
