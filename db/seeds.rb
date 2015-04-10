# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' , { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# The order is important! DO NOT CHANGE!
# delete all data
TerminationRequest.delete_all
ParkingRequest.delete_all
MaintenanceRequest.delete_all
HousingRequest.delete_all
Invoice.delete_all
SignedLease.delete_all
ParkingSpot.delete_all
Room.delete_all
FamilyApt.delete_all
Student.delete_all
Staff.delete_all
Person.delete_all
ParkingClass.delete_all
ParkingLot.delete_all
BuildingsApt.delete_all

#define query head
db = ActiveRecord::Base.connection

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
    class_name: 'Small car',
    fee: 35}])

ParkingClass.create([
    {class_id: 2,
    class_name: 'Large car',
    fee: 40}])

ParkingClass.create([
    {class_id: 3,
    class_name: 'Bike',
    fee: 30}])

ParkingClass.create([
    {class_id: 4,
    class_name: 'Disabled',
    fee: 25}])

# each parkingLot only has one nearby building
# parking lot 1
ParkingLot.create([
    {lot_no: 1,
    nearby_housing: 'Gryffindor Hall'}])

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
    nearby_housing: 'Slytherin Hall'}])

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
    nearby_housing: 'Ravenclaw'}])

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
    nearby_housing: 'Ravenclaw'}])

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
    nearby_housing: 'Hufflepuff'}])

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
    lot_no: 5}])

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
    nearby_housing: 'Hogwarts'}])

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
    works_in_building: 'Gryffindor Hall',
    job_title: 'Supervisor'}])

Person.create([
                  {pid: 'A02',
                   password: '1234',
                   fname: 'Severus',
                   lname: 'Snape',
                   street: 'Snape Road',
                   city:  'Lahore',
                   state: '',
                   country: 'Pakistan',
                   DOB: '1953-09-07',
                   phone: '',
                   gender: 'M'}])

Staff.create([
                 {staff_id: 'A02',
                  works_in_building: 'Slytherin Hall',
                  job_title: 'Supervisor'}])

Person.create([
                  {pid: 'A03',
                   password: '1234',
                   fname: 'Filius',
                   lname: 'Flitwick',
                   street: 'Flitwick Road',
                   city:  'Sydney',
                   state: '',
                   country: 'Australia',
                   DOB: '1960-11-06',
                   phone: '',
                   gender: 'M'}])

Staff.create([
                 {staff_id: 'A03',
                  works_in_building: 'Ravenclaw',
                  job_title: 'Supervisor'}])

Person.create([
                  {pid: 'A04',
                   password: '1234',
                   fname: 'Albus',
                   lname: 'Dumbledore',
                   street: 'Dumbledore Road',
                   city:  'Gandhinagar',
                   state: '',
                   country: 'India',
                   DOB: '1945-04-23',
                   phone: '',
                   gender: 'M'}])

Staff.create([
                 {staff_id: 'A04',
                  works_in_building: 'Hogwarts',
                  job_title: 'Supervisor'}])


Person.create([
                  {pid: 'A05',
                   password: '1234',
                   fname: 'Pomona',
                   lname: 'Sprout',
                   street: 'Sprout Road',
                   city:  'Berlin',
                   state: '',
                   country: 'Germany',
                   DOB: '1965-11-16',
                   phone: '',
                   gender: 'F'}])

Staff.create([
                 {staff_id: 'A05',
                  works_in_building: 'Hogwarts',
                  job_title: 'Supervisor'}])

Person.create([
                  {pid: '100540002',
                   password: '1234',
                   fname: 'Draco',
                   lname: 'Malfoy',
                   street: '31 B, Malfoy Drive',
                   city:  'New York',
                   state: 'NY',
                   country: 'USA',
                   DOB: '1990-06-05',
                   phone: '',
                   gender: 'M',
                   nationality:'American',
                   alt_phone:'',
                   zipcode:'27506'}])
Student.create([
                   {sid: '100540002',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'1',
                    spec_sneeds:'',
                    category:'Freshman',
                    course:'Muggle Studies',
                    kin_street:'31 B, Malfoy Drive',
                    kin_city:'New York',
                    kin_country:'USA',
                    kin_fname:'Lucius',
                    kin_lname:'Malfoy',
                    kin_relationship:'Father',
                    kin_phone:'9439560752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
    {sid: '100540002',
    place_no: '001',
    unit_no: 'Ravenclaw',
    start_date: '2015-01-01',
    end_date: '2015-07-31',
    pay_option: 2,
    parking_spot: "013"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540002"
  where unit_no = "Ravenclaw" and place_no = "001"')

ParkingSpot.find_by_spot_no('013').update(occupant: '100540002')


Person.create([
                  {pid: '100540003',
                   password: '1234',
                   fname: 'Ron',
                   lname: 'Weasley',
                   street: '31 B, Weasley Road',
                   city:  'Rome',
                   state: '',
                   country: 'Italy',
                   DOB: '1986-03-01',
                   phone: '9189567067',
                   gender: 'M',
                   nationality:'Italian',
                   alt_phone:'',
                   zipcode:'27456'}])
Student.create([
                   {sid: '100540003',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'',
                    category:'Graduate',
                    course:'Care of Magical Creatures',
                    kin_street:'31 B, Weasley Road',
                    kin_city:'Rome',
                    kin_country:'Italy',
                    kin_fname:'Aurthur',
                    kin_lname:'Weasley',
                    kin_relationship:'Father',
                    kin_phone:'9436660752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
    {sid: '100540003',
    place_no: '002',
    unit_no: 'Gryffindor Hall',
    start_date: '2015-01-01',
    end_date: '2015-07-31',
    parking_spot: '002',
    pay_option: 1,
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540003"
  where unit_no = "Gryffindor Hall" and place_no = "002"')

ParkingSpot.find_by_spot_no('002').update(occupant: '100540003')

Person.create([
                  {pid: '100540004',
                   password: '1234',
                   fname: 'Hermione',
                   lname: 'Granger',
                   street: '32 A, Granger Road',
                   city:  'Edinburg',
                   state: '',
                   country: 'Scotland',
                   DOB: '1986-09-19',
                   phone: '9189568567',
                   gender: 'F',
                   nationality:'Scottish',
                   alt_phone:'',
                   zipcode:'25556'}])
Student.create([
                   {sid: '100540004',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'',
                    category:'Graduate',
                    course:'Muggle Studies',
                    kin_street:'32 A, Granger Road',
                    kin_city:'Edinburg',
                    kin_country:'Scotland',
                    kin_fname:'Granger',
                    kin_lname:'Mr.',
                    kin_relationship:'Father',
                    kin_phone:'9433360752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
                       {sid: '100540004',
    place_no: '003',
    unit_no: 'Gryffindor Hall',
    start_date: '2015-01-01',
    end_date: '2015-07-31',
    pay_option: 1,
    parking_spot: "013"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540002"
  where unit_no = "Gryffindor Hall" and place_no = "003"')



Person.create([
                  {pid: '100540001',
                   password: '1234',
                   fname: 'Harry',
                   lname: 'Potter',
                   street: '31 B, Privet Drive',
                   city:  'London',
                   state: '',
                   country: 'England',
                   DOB: '1991-07-21',
                   phone: '9189327078',
                   gender: 'M',
                   nationality:'British',
                   alt_phone:'9176326078',
                   zipcode:'27605'}])
Student.create([
                   {sid: '100540001',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'',
                    category:'Freshman',
                    course:'Defence Against Dark Arts',
                    kin_street:'12, Grimmauld Place',
                    kin_city:'',
                    kin_country:'',
                    kin_fname:'Sirius',
                    kin_lname:'Black',
                    kin_relationship:'Godfather',
                    kin_phone:'9439560752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
                       {sid: '100540001',
    place_no: '001',
    unit_no: 'Gryffindor Hall',
    start_date: '2015-01-01',
    end_date: '2015-07-31',
    pay_option: 2,
    parking_spot: "003"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540001"
  where unit_no = "Gryffindor Hall" and place_no = "001"')

ParkingSpot.find_by_spot_no('003').update(occupant: '100540001')


Person.create([
                  {pid: '100540005',
                   password: '1234',
                   fname: 'Fred',
                   lname: 'Weasley',
                   street: '31 B, Weasley Road',
                   city:  'Rome',
                   state: '',
                   country: 'Italy',
                   DOB: '1982-11-20',
                   phone: '9189327078',
                   gender: 'M',
                   nationality:'Italian',
                   alt_phone:'9176326078',
                   zipcode:'27605'}])
Student.create([
                   {sid: '100540005',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'',
                    category:'Senior',
                    course:'Muggle Studies',
                    kin_street:'31 B, Weasley Road',
                    kin_city:'Rome',
                    kin_country:'Italy',
                    kin_fname:'Aurthur',
                    kin_lname:'Weasley',
                    kin_relationship:'Father',
                    kin_phone:'9436660752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
                       {sid: '100540005',
    place_no: '008',
    unit_no: 'Hufflepuff',
    start_date: '2015-01-01',
    end_date: '2015-05-31',
    pay_option: 1,
    parking_spot: "027"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540005"
  where unit_no = "Hufflepuff" and place_no = "008"')

ParkingSpot.find_by_spot_no('027').update(occupant: '100540005')


Person.create([
                  {pid: '100540006',
                   password: '1234',
                   fname: 'George',
                   lname: 'Weasley',
                   street: '31 B, Weasley Road',
                   city:  'Rome',
                   state: '',
                   country: 'Italy',
                   DOB: '1982-11-20',
                   phone: '9133368568',
                   gender: 'M',
                   nationality:'Italian',
                   alt_phone:'',
                   zipcode:'27605'}])
Student.create([
                   {sid: '100540006',
                    s_type: 'S',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'',
                    category:'Senior',
                    course:'Muggle Studies',
                    kin_street:'31 B, Weasley Road',
                    kin_city:'Rome',
                    kin_country:'Italy',
                    kin_fname:'Aurthur',
                    kin_lname:'Weasley',
                    kin_relationship:'Father',
                    kin_phone:'9436660752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
                       {sid: '100540006',
    place_no: '009',
    unit_no: 'Hufflepuff',
    start_date: '2015-01-01',
    end_date: '2015-07-31',
    pay_option: 2,
    parking_spot: "025"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540006"
  where unit_no = "Hufflepuff" and place_no = "009"')

ParkingSpot.find_by_spot_no('025').update(occupant: '100540006')



Person.create([
                  {pid: '100540007',
                   password: '1234',
                   fname: 'Bill',
                   lname: 'Weasley',
                   street: '32 A, William Road',
                   city:  'Brussels',
                   state: '',
                   country: 'Belgium',
                   DOB: '1982-10-29',
                   phone: '9198568567',
                   gender: 'M',
                   nationality:'Belgian',
                   alt_phone:'',
                   zipcode:'2535'}])
Student.create([
                   {sid: '100540007',
                    s_type: 'F',
                    add_comment:'',
                    s_status:'1',
                    smoke:'0',
                    spec_sneeds:'Difficulty in walking',
                    category:'Graduate',
                    course:'Potions',
                    kin_street:'31 B, Weasley Road',
                    kin_city:'Rome',
                    kin_country:'Italy',
                    kin_fname:'Aurthur',
                    kin_lname:'Weasley',
                    kin_relationship:'Father',
                    kin_phone:'9436660752',
                    kin_middle_name:'',
                    family_student:'1'

                   }
               ])

FamilyMember.create([{
  sid: '100540007',
  fname: 'Fleur',
  lname: 'Delacour',
  DOB: '1984-03-31'}])

SignedLease.create([
                       {sid: '100540007',
    place_no: '006',
    unit_no: 'Slytherin Hall',
    start_date: '2015-01-01',
    end_date: '2015-05-31',
    pay_option: 2,
    parking_spot: "007"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "100540005"
  where unit_no = "Slytherin Hall" and place_no = "006"')

ParkingSpot.find_by_spot_no('007').update(occupant: '100540007')


Person.create([
                  {pid: '200540001',
                   password: '1234',
                   fname: 'Viktor',
                   lname: 'Krum',
                   street: '32 A, Krum Road',
                   city:  'Sofia',
                   state: '',
                   country: 'Bulgaria',
                   DOB: '1982-10-29',
                   phone: '9198333567',
                   gender: 'M',
                   nationality:'Bulgarian',
                   alt_phone:'9198332233',
                   zipcode:'2535'}])
Student.create([
                   {sid: '200540001',
                    s_type: 'G',
                    add_comment:'',
                    s_status:'1',
                    smoke:'1',
                    spec_sneeds:'',
                    category: 'Visitor',
                    course:'Coaching - Triwizard Cup',
                    kin_street:'32 A, Krum Road',
                    kin_city:'Sofia',
                    kin_country:'Bulgaria',
                    kin_fname:'Igor',
                    kin_lname:'Karkaroff',
                    kin_relationship:'Headmaster',
                    kin_phone:'94363530752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])


SignedLease.create([
                       {sid: '200540001',
    place_no: '004',
    unit_no: 'Ravenclaw',
    start_date: '2015-03-01',
    end_date: '2015-04-30',
    pay_option: 1,
    parking_spot: "045"
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "200540001"
  where unit_no = "Ravenclaw" and place_no = "004"')

ParkingSpot.find_by_spot_no('045').update(occupant: '200540001')


Person.create([
                  {pid: '200540002',
                   password: '1234',
                   fname: 'Olympe',
                   lname: 'Maxime',
                   street: '32 A, Maxime Road',
                   city:  'Paris',
                   state: '',
                   country: 'France',
                   DOB: '1970-05-19',
                   phone: '9197773567',
                   gender: 'F',
                   nationality:'French',
                   alt_phone:'',
                   zipcode:'2221'}])
Student.create([
                   {sid: '200540002',
                    s_type: 'G',
                    add_comment:'',
                    s_status:'1',
                    smoke:'1',
                    spec_sneeds:'',
                    category:'Visitor',
                    course:'Guest Lecturer - Triwizard Cup',
                    kin_street:'32 A, Bagshot Road',
                    kin_city:'Zurich',
                    kin_country:'Switzerland',
                    kin_fname:'Bathilda',
                    kin_lname:'Bagshot',
                    kin_relationship:'Friend',
                    kin_phone:'94363595752',
                    kin_middle_name:'',
                    family_student:'0'

                   }
               ])

SignedLease.create([
                       {sid: '200540002',
    place_no: '005',
    unit_no: 'Ravenclaw',
    start_date: '2015-04-01',
    end_date: '2015-04-30',
    pay_option: 1
}])

#
# can't use object update b/c super key
#
db.execute('update rooms set occupant = "200540002"
  where unit_no = "Ravenclaw" and place_no = "005"')



Person.create([
                  {pid: '100540008',
                   password: '1234',
                   fname: 'Vernon',
                   lname: 'Dursley',
                   street: '32 A, Dursley Road',
                   city:  'Raleigh',
                   state: '',
                   country: 'USA',
                   DOB: '1975-11-29',
                   phone: '9198954357',
                   gender: 'M',
                   nationality:'American',
                   alt_phone:'9198954786',
                   zipcode:'27606'}])
Student.create([
                   {sid: '100540008',
                    s_type: 'F',
                    add_comment:'',
                    s_status:'1',
                    smoke:'1',
                    spec_sneeds:'',
                    category:'Graduate',
                    course:'Muggle Studies',
                    kin_street:'32 A, Dursley Road',
                    kin_city:'Raleigh',
                    kin_country:'USA',
                    kin_fname:'Petunia',
                    kin_lname:'Dursley',
                    kin_relationship:'Wife',
                    kin_phone:'94363654752',
                    kin_middle_name:'',
                    family_student:'1'

                   }
               ])


FamilyMember.create([{
                        sid: '100540008',
    fname: 'Petunia',
    lname: 'Dursley',
    DOB: '1978-12-13'},
    {sid: '100540008',
    fname: 'Dudley',
    lname: 'Dursley',
    DOB: '2000-06-26'}])

SignedLease.create([
                       {sid: '100540008',
    apt_no: '107',
    unit_no: 'Hogwarts',
    start_date: '2015-01-01',
    end_date: '2015-05-31',
    pay_option: 2,
    parking_spot: "038"
}])

#
# Family apt!
#
FamilyApt.find_by_apt_no('107').update(occupant: '100540008')

ParkingSpot.find_by_spot_no('038').update(occupant: '100540008')


Person.create([
                  {pid: '100540015',
    password: '1234',
    fname: 'Neville',
    lname: 'Longbottom',
    street: '321, First Street',
    city:  'Raleigh',
    state: 'NC',
    country: 'USA',
    DOB: '1985-11-29',
    phone: '9195942231',
    gender: 'M',
    nationality:'American',
    alt_phone:'94363659982',
    zipcode:'27606'}])

Student.create([
  {sid: '100540015',
  s_type: 'F',
  add_comment:'',
  s_status:'0',
  smoke: false,
  spec_sneeds:'',
  category:'Freshman',
  course:'Herbology',
  kin_street:'321, First Street',
  kin_city:'Raleigh',
  kin_country:'USA',
  kin_fname:'Petunia',
  kin_lname:'Dursley',
  kin_relationship:'Grandmother',
  kin_phone:'94363659982',
  family_student:'0'

  }
  ])


Person.create([
                  {pid: '100540012',
    password: '1234',
    fname: 'Remus',
    lname: 'Lupin',
    street: '12, Grimmauld Place',
    city:  'London',
    country: 'England',
    DOB: '1972-11-29',
    phone: '919877767',
    gender: 'M',
    nationality:'British',
    zipcode:'27605'}])


Student.create([
  {sid: '100540012',
  s_type: 'G',
  add_comment:'',
  s_status:'0',
  smoke: false,
  spec_sneeds:'',
  category:'Visitor',
  course:'Defense Against Dark Arts',
  kin_street:'12, Grimmauld Place',
  kin_city:'London',
  kin_country:'England',
  kin_fname:'Nymphadora',
  kin_lname:'Tonks',
  kin_relationship:'Wife',
  kin_phone:'9363555752',
  family_student:'0'
  }
  ])