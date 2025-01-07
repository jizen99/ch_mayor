function CH_Mayor.FormatPlaytime( t )
	local TimeLeft = tonumber( t ) or 0
	local Minutes = math.floor( TimeLeft )
	local Hours = math.floor( Minutes / 60 )
	local Days = math.floor( Hours / 24 )
	
	if Hours >= 1 then
		Minutes = math.Round( Minutes - Hours * 60 )
	end
	
	if Days >= 1 then
		Hours = math.Round( Hours - Days * 24 )
	end
	
	if Minutes == 1 then
		MinFormat = CH_Mayor.LangString( "minute" )
	else
		MinFormat = CH_Mayor.LangString( "minutes" )
	end
	
	if Hours == 1 then
		HourFormat = CH_Mayor.LangString( "hour" )
	else
		HourFormat = CH_Mayor.LangString( "hours" )
	end
	
	if Days == 1 then
		DayFormat = CH_Mayor.LangString( "day" )
	else
		DayFormat = CH_Mayor.LangString( "days" )
	end
	
	if TimeLeft == 0 then
		return "0 ".. CH_Mayor.LangString( "minutes" )
	end
	
	if Days < 1 && Hours < 1 && Minutes >= 1 then
		return Minutes.." "..MinFormat
	elseif Days < 1 && Hours >= 1 then
		return Hours.." "..HourFormat..", "..Minutes.." "..MinFormat
	elseif Days >=1 && Hours < 1 then
		return Days.." "..DayFormat..", "..Minutes.." "..MinFormat
	else
		return Days.." "..DayFormat.." "..Hours.." "..HourFormat.." "..Minutes.." "..MinFormat
	end
end