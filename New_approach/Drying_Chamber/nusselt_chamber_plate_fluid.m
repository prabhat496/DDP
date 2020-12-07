function nusselt_chamber_plate_fluid = nusselt_chamber_plate_fluid(Ra)

	num = 0.387*(Ra^(1/6));
	den = (1+((0.492)^(9/16)))^(8/27);

	nusselt_chamber_plate_fluid = (0.825 + (num/den))^2;
end
