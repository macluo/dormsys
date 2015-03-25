# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

class CreateDatabase < ActiveRecord::Migration

  def self.up

  execute "create table persons (id char(10), password char(20) NOT NULL, type varchar(10), fname varchar(20) NOT NULL, mname varchar(20), lname varchar(20) NOT NULL, nationality varchar(10), street varchar(50), city varchar(50), country varchar(50), DOB date, phone char(15), alt_phone char(15), gender char(1), primary key(id) );"

  execute "create table students( sid char(10), s_type varchar(5), add_comment varchar(100), s_status integer, smoke boolean, spec_sneeds varchar(50), category varchar(20), kin_street varchar(50), kin_city varchar(50), kin_country varchar(50), kin_fname varchar(20) NOT NULL, kin_lname varchar(20) NOT NULL, kin_phone char(10) NOT NULL, kin_middle_name varchar(20), primary key(sid), foreign key(sid) references persons(id) );"

  execute "create table family_members( sid char(10) NOT NULL, fname varchar(20), lname varchar(20), mname varchar(20), DOB date, primary key(sid, fname, lname), foreign key(sid) references students(sid) ON DELETE cascade);"

  execute "create table buildings_apts( unit_no varchar(20), manager_fname varchar(20), manager_lname varchar(20), phone_no char(10), category int, primary key(unit_no));"

  execute "create table rooms( unit_no varchar(20) NOT NULL, place_no varchar(10), room_no int, rent float, primary key(place_no), foreign key(unit_no) references buildings_apts(unit_no) on delete cascade);"

  execute "create table family_apts( apt_no varchar(10), no_bedrm int, no_bath int, rent float, primary key(apt_no));"

  execute "create table parking_lots( lot_no int, nearby_housing varchar(60), primary key(lot_no));"

  execute "create table parking_class ( class_id int,  class varchar(10),  fee float,  primary key(class_id));"

  execute "create table parking_spots( spot_no char(10), class_id int, lot_no int NOT NULL, primary key(spot_no), foreign key(lot_no) references parking_lots(lot_no), foreign key(class_id) references parking_class(class_id));"

  execute "create table signed_leases ( lease_no int, sid char(10) NOT NULL, place_no varchar(10), apt_no varchar(10), rent float, parking_fee float, start_sem int, end_sem int, deposit float, pay_option int, parking_spot char(10), permit_id int unique, primary key(lease_no), foreign key(sid) references students(sid), foreign key(parking_spot) references parking_spots(spot_no), foreign key(place_no) references rooms(place_no), foreign key(apt_no) references family_apts(apt_no), constraint chk_duplicate unique(sid, start_sem, end_sem));"

  execute "create table housing_requests( req_no int, sid CHAR(10) NOT NULL, status int, parking boolean, park_class int, pref_nearby boolean, building_pref_1 varchar(10), building_pref_2 varchar(10), building_pref_3 varchar(10), apt_pref_1 varchar(10), apt_pref_2 varchar(10), apt_pref_3 varchar(10), primary key(req_no), foreign key(sid) references students(sid), foreign key(park_class) references parking_class(class_id), foreign key(building_pref_1) references buildings_apts(unit_no), foreign key(building_pref_2) references buildings_apts(unit_no), foreign key(building_pref_3) references buildings_apts(unit_no), foreign key(apt_pref_1) references family_apts(apt_no), foreign key(apt_pref_2) references family_apts(apt_no), foreign key(apt_pref_3) references family_apts(apt_no));"

  execute "create table termination_requests( t_req_no int, lease_no int NOT NULL, insp_date date, status int, reason varchar(50), termination_date date, primary key(t_req_no), foreign key(lease_no) references signed_leases(lease_no));"

  execute "create table invoices ( inv_no int, duedate date, payment_due float, sid char(10), lease_no int NOT NULL, paid_date date, pay_method varchar(10), paid boolean, bill_start_date date, bill_end_date date, primary key(inv_no), foreign key(lease_no) references signed_leases(lease_no), foreign key(sid) references students(sid));"

  execute "create table maintenance_requests( ticket_no int, severity varchar(10), created_date date, apt_no varchar(10), place_no varchar(20), unit_no varchar(20), comments varchar(50), sid char(10) NOT NULL, primary key(ticket_no), foreign key(sid) references students(sid), foreign key (apt_no) references family_apts(apt_no), foreign key(place_no) references rooms(place_no), foreign key(unit_no) references buildings_apts(unit_no));"

  execute "create table staffs( staff_id char(10), works_in_building varchar(20), works_in_apt varchar(10), job_title varchar(10), primary key(staff_id), foreign key(staff_id) references persons(id), foreign key(works_in_building) references buildings_apts(unit_no), foreign key(works_in_apt) references family_apts(apt_no));"

  execute "create table proc_housing( staff_id char(10), req_no int, process_date date, process_comments varchar(100), primary key(staff_id, req_no), foreign key(req_no) references housing_requests(req_no) on delete cascade, foreign key(staff_id) references staffs(staff_id));"

  execute "create table proc_termination( staff_id char(10), t_req_no int, process_date date, process_comments varchar(100), primary key(staff_id, t_req_no), foreign key(t_req_no) references termination_requests(t_req_no), foreign key(staff_id) references staffs(staff_id));"

  execute "create table proc_maintenance( staff_id char(10), ticket_no int, process_date date, process_comments varchar(100), primary key(staff_id, ticket_no), foreign key(ticket_no) references maintenance_requests(ticket_no), foreign key(staff_id) references staffs(staff_id));"

  end

  def self.down
    # drop all tables here
  end

end