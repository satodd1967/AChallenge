module Convert
    include ActiveSupport::Concern

    def to_decimal(float)
        float/100
    end

end