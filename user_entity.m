classdef user_entity
    properties
        %identification
        id;
        %position
        pos;
        %noise
        noise;
        %channel
        ch;
    end
   
    methods
        function obj = user_entity(id_attr, pos_attr, noise_attr)
            % Constructor
            obj.id = id_attr;
            obj.pos = pos_attr;
            obj.noise = noise_attr;
            obj.ch = channel();
        end

        function dist = distance(self, b)
            % Calculate Distance between Base Station and User Entity
            tmp_pos = self.pos - b.pos;
            dist = sqrt(sum(tmp_pos.^2));
        end
        
        function fr = friis(self, b)
            lambda = 300000000 / b.frq;
            % need to lookup additional gain values
            fr = b.pwr + b.gain + 20 * log10(lambda/(4*pi*self.distance(b)));
        end
        
        function s = snr(self, b, sel)
            % Returns Signal-To-Noise Ratio
            interference = 0;
            % Sum over all elements except #sel
            for i = 1:length(b)
                interference = interference + b(i).pwr - self.friis(b(i));
            end
            interference = interference - ( b(sel).pwr - self.friis(b(sel)));
            % p_R = p_T - p_L
            s = (b(sel).pwr - self.friis(b(sel))+10*log10(self.ch.ray_chan())) - (interference + self.noise);
        end

    end
end
