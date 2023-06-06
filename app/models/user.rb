class User < ApplicationRecord
  belongs_to :pseudo, optional:true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.pseudos
    having("updated_at > ?", 10.minutes.ago).group("users.id").joins("left join pseudos where users.pseudo_id = pseudos.id").select("users.*, pseudos.image, pseudos.name as username, pseudos.body as pseudobody,pseudos.id as pseudoid")
  end
end
