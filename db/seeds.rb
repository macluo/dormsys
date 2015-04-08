# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' , { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# delete all data
Room.delete_all
Student.delete_all
Staff.delete_all
Person.delete_all
Room.delete_all
FamilyApt.delete_all
BuildingsApt.delete_all
ParkingSpot.delete_all
ParkingClass.delete_all
ParkingLot.delete_all

# don't enter manager name here,
#category: 1 halls
BuildingsApt.create([
{unit_no: 'Gryffindor Hall',
address: '2751 Cates Avenue, Gryffindor Residence Hall, Raleigh, NC 27607',
    phone_no: '919540001',
    category: 1,
    rent: 400,
    deposit: 400}])

Room.create([
    {unit_no: 'Gryffindor Hall',
    place_no: '001'}])

Room.create([
    {unit_no: 'Gryffindor Hall',
    place_no: '002'}])

Room.create([
    {unit_no: 'Gryffindor Hall',
    place_no: '003'}])

Room.create([
    {unit_no: 'Gryffindor Hall',
    place_no: '004'}])

Room.create([
    {unit_no: 'Gryffindor Hall',
    place_no: '005'}])



BuildingsApt.create([
{unit_no: 'Slytherin Hall',
address: '210 Dan Allen Dr, Raleigh, NC 27695',
    phone_no: '919540002',
    category: 1,
    rent: 450,
    deposit: 500,
    upper_class: true}])

Room.create([
    {unit_no: 'Slytherin Hall',
    place_no: '006'}])

Room.create([
    {unit_no: 'Slytherin Hall',
    place_no: '007'}])

Room.create([
    {unit_no: 'Slytherin Hall',
    place_no: '008'}])



#category: 2 apts
# not going to capture no_bath here. hahaha...
# room_no contains apt_no + room no.
BuildingsApt.create([
{unit_no: 'Ravenclaw',
address: '315, Gorman Crossings, Raleigh - 27606, NC',
    phone_no: '919540003',
    category: 2,
    rent: 350,
    deposit: 400}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '001',
    apt_no: '101',
    room_no: '001'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '002',
    apt_no: '101',
    room_no: '002'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '003',
    apt_no: '101',
    room_no: '003'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '004',
    apt_no: '102',
    room_no: '004'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '005',
    apt_no: '102',
    room_no: '005'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '006',
    apt_no: '102',
    room_no: '006'}])

Room.create([
    {unit_no: 'Ravenclaw',
    place_no: '007',
    apt_no: '102',
    room_no: '007'}])



BuildingsApt.create([
{unit_no: 'Hufflepuff',
address: '515, University Commons, Raleigh - 27606, NC',
    phone_no: '919540004',
    category: 2,
    rent: 375,
    deposit: 450}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '008',
    apt_no: '103',
    room_no: '008'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '009',
    apt_no: '103',
    room_no: '009'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '010',
    apt_no: '103',
    room_no: '010'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '011',
    apt_no: '104',
    room_no: '011'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '012',
    apt_no: '104',
    room_no: '012'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '013',
    apt_no: '104',
    room_no: '013'}])

Room.create([
    {unit_no: 'Hufflepuff',
    place_no: '014',
    apt_no: '104',
    room_no: '014'}])


#category: 3 family apts
BuildingsApt.create([
    {unit_no: 'Hogwarts',
    address: '300, Wade Avenue, Raleigh - 27606, NC',
    phone_no: '919540005',
    category: 3}])

FamilyApt.create([
    {unit_no: 'Hogwarts',
    apt_no:  '105',
    no_bedrm:  1,
    rent:  450,
    deposit: 500}])

FamilyApt.create([
    {unit_no: 'Hogwarts',
    apt_no:  '106',
    no_bedrm:  2,
    rent:  550,
    deposit: 600}])

FamilyApt.create([
    {unit_no: 'Hogwarts',
    apt_no:  '107',
    no_bedrm:  3,
    rent:  700,
    deposit: 800}])


# parking class is defined here
# class_id is defined below
# 1: small car
# 2: large car
# 3: bike
# 4: handicapped
ParkingClass.create([
    {class_id: 1,
    :class => 'Small car',
    fee: 35}])

ParkingClass.create([
    {class_id: 2,
    :class => 'Large car',
    fee: 40}])

ParkingClass.create([
    {class_id: 3,
    :class => 'Bike',
    fee: 30}])

ParkingClass.create([
    {class_id: 4,
    :class => 'Handicapped',
    fee: 25}])

# each parkingLot only has one nearby building
# parking lot 1
ParkingLot.create([
    {lot_no: 1,
    nearby_house: 'Gryffindor Hall'}])

ParkingSpot.create([
    {spot_no: '001',
    class_id: 4,
    lot_no: 1}])

ParkingSpot.create([
    {spot_no: '002',
    class_id: 3,
    lot_no: 1}])

ParkingSpot.create([
    {spot_no: '003',
    class_id: 1,
    lot_no: 1}])

ParkingSpot.create([
    {spot_no: '004',
    class_id: 2,
    lot_no: 1}])


# parking lot 2
ParkingLot.create([
    {lot_no: 2,
    nearby_house: 'Slytherin Hall'}])

ParkingSpot.create([
    {spot_no: '005',
    class_id: 4,
    lot_no: 2}])

ParkingSpot.create([
    {spot_no: '006',
    class_id: 3,
    lot_no: 2}])

ParkingSpot.create([
    {spot_no: '007',
    class_id: 1,
    lot_no: 2}])

ParkingSpot.create([
    {spot_no: '008',
    class_id: 1,
    lot_no: 2}])

ParkingSpot.create([
    {spot_no: '009',
    class_id: 1,
    lot_no: 2}])

ParkingSpot.create([
    {spot_no: '010',
    class_id: 2,
    lot_no: 2}])

# parking lot 3
ParkingLot.create([
    {lot_no: 3,
    nearby_house: 'Ravenclaw'}])

ParkingSpot.create([
    {spot_no: '011',
    class_id: 4,
    lot_no: 3}])

ParkingSpot.create([
    {spot_no: '012',
    class_id: 3,
    lot_no: 3}])

ParkingSpot.create([
    {spot_no: '013',
    class_id: 1,
    lot_no: 3}])

ParkingSpot.create([
    {spot_no: '014',
    class_id: 1,
    lot_no: 3}])

ParkingSpot.create([
    {spot_no: '015',
    class_id: 2,
    lot_no: 3}])

ParkingSpot.create([
    {spot_no: '016',
    class_id: 2,
    lot_no: 3}])


# parking lot 4
ParkingLot.create([
    {lot_no: 4,
    nearby_house: 'Ravenclaw'}])

ParkingSpot.create([
    {spot_no: '017',
    class_id: 4,
    lot_no: 4}])

ParkingSpot.create([
    {spot_no: '018',
    class_id: 3,
    lot_no: 4}])

ParkingSpot.create([
    {spot_no: '019',
    class_id: 1,
    lot_no: 4}])

ParkingSpot.create([
    {spot_no: '020',
    class_id: 2,
    lot_no: 4}])


# parking lot 5
ParkingLot.create([
    {lot_no: 5,
    nearby_house: 'Hufflepuff'}])

ParkingSpot.create([
    {spot_no: '021',
    class_id: 4,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '022',
    class_id: 4,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '023',
    class_id: 3,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '024',
    class_id: 3,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '025',
    class_id: 1,
    lot_no: 4}])

ParkingSpot.create([
    {spot_no: '026',
    class_id: 1,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '027',
    class_id: 2,
    lot_no: 5}])

ParkingSpot.create([
    {spot_no: '028',
    class_id: 2,
    lot_no: 5}])



# parking lot 6
ParkingLot.create([
    {lot_no: 6,
    nearby_house: 'Hogwarts'}])

ParkingSpot.create([
    {spot_no: '029',
    class_id: 4,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '030',
    class_id: 4,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '031',
    class_id: 3,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '032',
    class_id: 3,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '033',
    class_id: 1,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '034',
    class_id: 1,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '035',
    class_id: 1,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '036',
    class_id: 1,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '037',
    class_id: 1,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '038',
    class_id: 2,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '039',
    class_id: 2,
    lot_no: 6}])

ParkingSpot.create([
    {spot_no: '040',
    class_id: 2,
    lot_no: 6}])


# general parking lot, no neary housing
ParkingLot.create([
    {lot_no: 7}])

ParkingSpot.create([
    {spot_no: '041',
    class_id: 4,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '042',
    class_id: 4,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '043',
    class_id: 3,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '044',
    class_id: 3,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '045',
    class_id: 1,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '046',
    class_id: 1,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '047',
    class_id: 1,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '048',
    class_id: 1,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '049',
    class_id: 1,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '050',
    class_id: 2,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '051',
    class_id: 2,
    lot_no: 7}])

ParkingSpot.create([
    {spot_no: '052',
    class_id: 2,
    lot_no: 7}])


# persons are entered below
Person.create([
    {pid: 'A01',
    password: '1234',
    fname: 'Minerva',
    lname: 'McGonagall',
    street: 'McGonagall Road',
    city:  'Delhi',
    state: '',
    country: 'India',
    DOB: '1950-10-4',
    phone: '',
    gender: 'F'}])

Staff.create([
    {staff_id: 'A01',
    workis_in_building: 'Gryffindor Hall',
    job_title: 'Hall Manager/Supervisor'}])