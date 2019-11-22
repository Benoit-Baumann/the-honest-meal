class Restaurant < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, class_name: 'User'
  has_many :restaurant_photos
  has_many :reviews
  has_many :coupons
<<<<<<< HEAD
  has_one :question_pools
  has_many :questions, through: :question_pools

  validates :owner, presence: true
  validates :name, presence: true
  validates :siret, presence: true, uniqueness: true
  validates :address, presence: true
  validates :pricing, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..3 }
=======

  # validates :owner, presence: true
  # validates :name, presence: true
  # validates :siret, presence: true, uniqueness: true
  # validates :address, presence: true
  # validates :pricing, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..3 }
>>>>>>> a3cf1f6... recuperation des données dans la DB, affichage evolution de la note et du nombre de review en fonction du mois de l'année
  # validates :hours, presence: true
  # validates :description, presence: true
  # validates :category, presence: true
  # validates :phone_number, presence: true # regex numéro francais
  # validates :website, presence: true

  private

  def valid_siret?
    # self.siret
    tmp = self.siret.gsub(/\D/, '')
    return false if tmp.length != 14

  end

end
