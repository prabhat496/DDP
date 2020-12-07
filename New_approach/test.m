T_ambient = 298;
T_plate = 340;
T_glazing = 320;
T_fluid = T_ambient;
T_fluido= T_ambient;
T_bottom = 300;

	[T_plate, T_glazing, T_bottom, T_fluid] = collector_iteration(T_plate, T_glazing, T_bottom, T_fluid)
    
	while(abs(T_fluido-T_fluid)>0.001)
        
        T_fluido = T_fluid;

		[T_plate, T_glazing, T_bottom, T_fluid] = collector_iteration(T_plate, T_glazing, T_bottom, T_fluid)
	end