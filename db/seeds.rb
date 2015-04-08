# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# don't enter manager name here,
BuildingsApt.create([
    {address: ''},
    {phone_no: ''},
    {category: 1},
    {rent: 400},
    {deposit: 400},
    {apt_no: nil},
    {no_bath: nil}])

FamilyApt.create([
    {unit_no: ''},
    {apt_no:  ''},
    {no_bedrm:  0},
    {no_bath: 0},
    {rent:  400},
    {deposit: 400}])

# parking class is defined here
# class_id is defined below
# 1: small car
# 2: large car
# 3: bike
# 4: handicapped
ParkingClass.create([
    {class_id: 1},
    {:class => ''},
    {fee: 20}])

# each parkingLot only has one nearby building
ParkingLot.create([
    {lot_no: 0},
    {nearby_house: ''}])

ParkingSpot.create([
    {spot_no: ''},
    {class_id: 0},
    {lot_no: 0}])

Person.create([
    {pid: ''},
    {password: ''},
    {fname: ''},
    {lname: ''},
    {nationality: ''},
    {street: ''},
    {city:  ''},
    {state: ''},
    {country: ''},
    {DOB: ''},
    {phone: ''},
    {gender: 'M'}])