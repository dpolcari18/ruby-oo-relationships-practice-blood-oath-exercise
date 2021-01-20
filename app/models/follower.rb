class Follower
    attr_accessor :name, :age, :life_motto
    
    @@all = []
    
    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto

        save
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select{|followers| 
            followers.age >= age}.map{|old_followers| 
                old_followers.name}
    end

    # Only returns one value if there is a tie...
    def self.most_active
        bo_arr = BloodOath.all.map {|bos| bos.follower}
        bo_arr.max_by {|bos| bo_arr.count(bos)}
    end

    def self.top_ten
        bo_hash = BloodOath.all.map {|bos| 
            bos.follower.name}.inject(Hash.new(0)) {|hash, value|
                hash[value] += 1 ; hash}
        bo_hash.max_by(10) {|k, v| v}.map {|tops| tops[0]}     
    end

    def save
        Follower.all.push(self)
    end

    def my_cults
        BloodOath.all.select{|blood_oaths| blood_oaths.follower == self}
    end

    def cults
        self.my_cults.map {|my_bos| my_bos.cult.name}
    end

    def join_cult(cult)
        self.age > cult.min_age ? 
            BloodOath.new(cult, self, Date.today.to_s) :
            "Sorry you are not old enough to join this cult."
    end

    def my_cults_slogans
        self.my_cults.map {|my_cults| puts my_cults.cult.slogan}
    end

    def fellow_cult_members
        self.my_cults.map {|my_bos| 
            my_bos.cult}.map {|cults| 
                cults.cult_bloodoaths}.flatten.map {|bos| 
                    bos.follower.name}.uniq
    end
end