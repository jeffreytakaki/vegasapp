class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :guest, :mgm, :sat, :sun, :mon
end
