function rayleigh = rayleigh(g_acc, vol_expan_coeff, T_plate, T_glazing, gap_plate_glazing, kin_viscosity, therm_diffusivity)		%Rayleigh Number
	
    rayleigh = (g_acc.*vol_expan_coeff.*(T_plate - T_glazing).*((gap_plate_glazing).^3))./(therm_diffusivity.*kin_viscosity);

end
