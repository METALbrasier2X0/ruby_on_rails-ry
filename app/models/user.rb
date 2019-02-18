class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :photos

    mount_uploader :avatar, AvatarUploader
    #validates:first_name,presence:true
    #validates:last_name,presence:true
    #validates:birth_date,presence:true

    def name
        self.first_name+" "+self.last_name
    end

    def age
        now = Time.now.utc.to_date
        age = now.year - self.birth_date.year - ((now.month > self.birth_date.month || (now.month == self.birth_date.month && now.day >= self.birth_date.day)) ? 0 : 1)
        return age
    end
end
