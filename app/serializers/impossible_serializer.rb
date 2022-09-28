class ImpossibleSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :impossible
  attributes :message
end
