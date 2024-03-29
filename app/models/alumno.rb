class Alumno < ActiveRecord::Base
  has_many :calificaciones
  has_many :asignaturas, :through => :calificaciones
  has_one :user, :as => :logable

  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :email, :presence =>true, :format => { :with => /\A[a-zA-Z0-9_.]+@[a-z.]+\z/i,  :message => "The correct email format is name@server.com"}
  validates_uniqueness_of :email

  accepts_nested_attributes_for :user, :reject_if => :all_blank


def asignaturas_restantes
  ids = Asignatura.all.map{|a| a.id}
  ids_a_eliminar = asignaturas.map{|a| a.id}
  ids_a_mostrar = ids - ids_a_eliminar
  Asignatura.find(ids_a_mostrar)
end

end


#TODO: Mostrar solo las que el alumno no tiene
# == Schema Information
#
# Table name: alumnos
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  apellido   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  email      :string(255)
#  emailuji   :string(255)
#

