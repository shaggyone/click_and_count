class LinesSerializer < ActiveModel::Serializer
  self.root = false

  attributes :data, :timestamp, :queries_number, :errors

  def timestamp
    object.created_at.strftime "%d.%m.%Y %H:%M:%S"
  end

  def queries_number
    Line.count
  end
end

