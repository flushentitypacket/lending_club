module LendingClub
  class Response

    def initialize(response_hash)
      @data = response_hash
    end

    attr_reader :data

  end
end
