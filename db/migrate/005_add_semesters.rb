class AddSemesters < ActiveRecord::Migration

  def self.up
    execute "create table semesters (no int, year int, term char(10), primary key(no));"

    # this is the standard semester lookup table, so the table is seeded here
    execute "insert into semesters values (1, 2013, 'Spring');"
    execute "insert into semesters values (2, 2013, 'Fall');"
    execute "insert into semesters values (3, 2014, 'Spring');"
    execute "insert into semesters values (4, 2014, 'Fall');"
    execute "insert into semesters values (5, 2015, 'Spring');"
    execute "insert into semesters values (6, 2015, 'Fall');"
    execute "insert into semesters values (7, 2016, 'Spring');"
    execute "insert into semesters values (8, 2016, 'Fall');"
    execute "insert into semesters values (9, 2017, 'Spring');"
    execute "insert into semesters values (10, 2017, 'Fall');"
  end

  def self.down
    execute "drop table semesters;"
  end

end