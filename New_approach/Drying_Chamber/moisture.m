function moisture = moisture(T_fluid, v_air, M_prev, M_eq):

	c 	= ((0.004*T - 1.1693)*(1 + log(v_air)))/5.04; % Only for the mango, used by Dhariwal
	t	= 3600;

	moisture = M_prev - (M_prev - M_eq)*(exp(-1*c*t));

end
