num = 60;

plate_temp = zeros(1, num);
glazing_temp= zeros(1, num);
fluid_temp = zeros(1, num);
bottom_temp = zeros(1, num);

T_ambient = 298;
T_plate   =  340;
T_glazing = T_ambient+1;
T_bottom = T_ambient+5;
T_fluido = 316;


for j = 1:num
    
    for i = 1:100
    
        %while(i<num)

        [T_plate, T_glazing, T_bottom, T_fluid] = chamber_iteration(T_plate, T_glazing, T_bottom, T_fluido, T_ambient);
	%end


    end
    
    T_fluido = T_fluid;
    plate_temp(j) = T_plate;
	glazing_temp(j) = T_glazing;
	fluid_temp(j) = T_fluid;
    bottom_temp(j) = T_bottom;
    
end






