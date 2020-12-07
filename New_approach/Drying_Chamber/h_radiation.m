function h_radiation = h_radiation(sigma, T1, T2, epsilon1, epsilon2)

	num = sigma*(T1^2 + T2^2)*(T1+T2);
	den = ((1/epsilon1)+(1/epsilon2)-1);

	h_radiation = num/den;

end


