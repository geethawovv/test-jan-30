class User 
  include ActiveModel::Serializers
  attributes :id,:firstname, :lastname, :email
end