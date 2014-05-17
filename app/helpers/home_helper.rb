module HomeHelper
	def pick_guitar(color_wht)
		color_wht_b = to_boolean(color_wht)
		if color_wht_b
			@image = 'FlyingVW.jpg' 
		else
			@image = 'FlyingVN.jpg'
		end
	end

	def to_boolean(str)
		str == 'true'
	end

end
