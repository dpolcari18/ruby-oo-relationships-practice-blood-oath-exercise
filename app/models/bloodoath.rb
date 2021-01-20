class BloodOath
    attr_accessor :cult, :follower, :initiation_date

    @@all = []

    def initialize(cult, follower, initiation_date)
        @cult = cult
        @follower = follower
        @initiation_date = initiation_date

        save
    end

    def self.all
        @@all
    end

    def self.first_oath
        self.all.min_by {|blood_oaths| blood_oaths.initiation_date}.follower
    end

    def save
        BloodOath.all.push(self)
    end
end