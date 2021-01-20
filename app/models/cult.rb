require 'date'

class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :min_age

    @@all = []

    def initialize(name, location, founding_year, slogan, min_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @min_age = min_age
        
        save
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|cults| cults.name == name }
    end

    def self.find_by_location(location)
        self.all.select {|cults| 
            cults.location == location}.map {|locations| 
                locations.name}
    end

    def self.find_by_founding_year(founding_year)
        self.all.select {|cults| cults.founding_year == founding_year}
    end

    # Only returns one value if there is a tie...
    def self.least_popular
        self.all.reduce {|acc, cult| 
            cult.cult_population < acc.cult_population ? cult : acc}
    end

    # Only returns one value if there is a tie...
    def self.most_common_location
        bo_arr = BloodOath.all.map {|blood_oaths| blood_oaths.cult.location}
        bo_arr.max_by {|bos| bo_arr.count(bos)}
    end

    def save
        Cult.all.push(self)
    end

    def recruit_follower(follower)
        follower.age > self.min_age ?
            BloodOath.new(self, follower, Date.today.to_s) :
            "Sorry you are not old enough to join this cult."
    end

    # Returns array of all bloodoath instances
    def cult_bloodoaths
        BloodOath.all.select {|blood_oaths| blood_oaths.cult == self}
    end

    def cult_population
        self.cult_bloodoaths.length
    end

    def average_age
        age_arr = self.cult_bloodoaths.map {|blood_oaths| blood_oaths.follower.age}
        age_arr.sum(0.0)/age_arr.size
    end

    def my_followers_mottos
        self.cult_bloodoaths.each {|blood_oaths| puts blood_oaths.follower.life_motto}
    end
end