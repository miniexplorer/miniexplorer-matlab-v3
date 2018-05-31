classdef RealTimeCompass < handle
    properties
        FH % figure handle
        AH % axes handle
        LH % line handles
    end
    
    methods
        function obj = RealTimeCompass()
            obj.createBlankPlot();
        end
        
        function createBlankPlot(obj)
            obj.FH = figure;
            obj.AH = axes;
            
            % Initialization of compass chart with axis to 1200 mm.
            chart_init = eig(randn(20,20));
            obj.LH = compass(obj.AH, 1200 * ones(size(chart_init)));
            set(obj.LH, 'Visible', 'off')
            hold(obj.AH, 'off');
        end
        
        
        function updatePlot(obj, measurements)
            hold(obj.AH, 'off');
            % Initialization of compass chart with axis to 1200 mm.
            chart_init = eig(randn(20,20));
            obj.LH = compass(obj.AH, 1200 * ones(size(chart_init)));
            set(obj.LH, 'Visible', 'off')
            hold(obj.AH, 'on');
            
            % Conversion of measurements to compass chart (polar) a plot.
            t = [fliplr(0:22.5:270) fliplr(292.5:22.5:337.5)];
            r = measurements .* exp(i * t * (pi/180));
            obj.LH = compass(obj.AH, r);
            
            hold(obj.AH, 'off');
            drawnow
        end
    end
end

