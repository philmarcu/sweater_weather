class Impossible
  attr_reader :message,
              :status,
              :id
  def initialize(data)
    @message = data[:messages].first
    @status = data[:statuscode]
    @id = nil
  end
end