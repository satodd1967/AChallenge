module Convert
    include ActiveSupport::Concern

    def to_decimal(float)
        float/100
    end

    def convert_percent
        if self.class.name == "Log"
            if self.body_fat > 1
                self.body_fat = to_decimal(self.body_fat)
            end
        else
            if self.start_body_fat > 1
                self.start_body_fat = to_decimal(self.start_body_fat)
            end
        end 
    end

end