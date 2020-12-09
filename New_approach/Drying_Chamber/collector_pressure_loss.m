function collector_pressure_loss = collector_pressure_loss(L, w, gap_collector_bottom, v_air, Re, air_density):

	fD 		= 96/Re; % Changed from 64/Re as suggested in the Cengel's book
	roughness = 0.001;

	if (Re>4000)
		fD = colebrook(c, Re, D_hydrolic)
	end

	D_hydrolic	= (2*(w*gap_collector_bottom))/(w+gap_collector_bottom);

	collector_pressure_loss = fD*(L/D_hydrolic)*(air_density*v_air*v_air)/(2);
end


% See the Dhariwal report and the cengel chapter 8 pg. 491.
