require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Mahomies", "Kansas City", 2017, "Run it Back")
cult2 = Cult.new("Techsans", "Lubbock", 2010, "Wreck 'em")
cult3 = Cult.new("ATX Fans", "Austin", 2014, "Keep Austin weird")
cult4 = Cult.new("Mavs Fans", "Dallas", 1992, "MFFL")

follower1 = Follower.new("David", 28, "Who moved my cheese?")
follower2 = Follower.new("Jeff", 31, "Hook 'em")
follower3 = Follower.new("Matt", 29, "Say what?")
follower4 = Follower.new("Wes", 28, "Wealthy Moses")
follower5 = Follower.new("Kevin", 38, "GEO rocks!")
follower6 = Follower.new("Brian", 59, "Drill!")
follower7 = Follower.new("Josh", 22, "IDK")
follower8 = Follower.new("Bo", 28, "I'm a dad")
follower9 = Follower.new("Ryan", 39, "Who am i?")
follower10 = Follower.new("John", 23, "Go dawgs!")
follower11 = Follower.new("Andy", 25, "Park the car")
follower12 = Follower.new("Af", 31, "Wanna chat")
follower13 = Follower.new("Bob", 62, "Coach")


bo1 = BloodOath.new(cult1, follower1, "2018-08-01")
bo2 = BloodOath.new(cult3, follower2, "2014-05-10")
bo3 = BloodOath.new(cult3, follower3, "2013-05-12")
bo4 = BloodOath.new(cult4, follower4, "1992-11-27")
bo5 = BloodOath.new(cult2, follower1, "2014-05-18")

cult1.recruit_follower(follower5)

cult1.cult_population

Cult.find_by_name("Mahomies")

Cult.find_by_location("Lubbock")

Cult.find_by_founding_year(2014)

follower1.cults

follower1.join_cult(cult3)
follower6.join_cult(cult4)
follower6.join_cult(cult3)
follower7.join_cult(cult2)
follower8.join_cult(cult1)
follower9.join_cult(cult1)
follower10.join_cult(cult2)
follower10.join_cult(cult1)
follower10.join_cult(cult3)
follower10.join_cult(cult4)
follower11.join_cult(cult4)
follower12.join_cult(cult3)

Follower.of_a_certain_age(29)

bo4.initiation_date

cult1.average_age

cult3.my_followers_mottos

Cult.least_popular

Cult.most_common_location

follower1.my_cults_slogans

Follower.most_active

Follower.top_ten

BloodOath.first_oath

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits