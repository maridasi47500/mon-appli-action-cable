class User < ApplicationRecord
  belongs_to :pseudo, optional:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.pseudos
    where("updated_at > ?", 10.minutes.ago).joins("left join pseudos where pseudos.user_id = users.id").select("users.*, pseudos.image, pseudos.name as username, pseudos.body as pseudobody,pseudos.id as pseudoid")
  end
end
