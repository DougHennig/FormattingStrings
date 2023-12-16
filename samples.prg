private lcUser, lnBalance
lcUser    = alltrim(substr(sys(0), at('#', sys(0)) + 1))
lnBalance = 12.3456
messagebox('Expression:' + chr(13) + ;
	"  Format('The balance for {0} on {1} is {2}', lcUser, datetime(), lnBalance)" + ;
	chr(13) + chr(13) + ;
	'Result:' + chr(13) + ;
	'  ' + Format('The balance for {0} on {1} is {2}', lcUser, datetime(), lnBalance), ;
	0, 'String.Format-like Syntax')
messagebox('Expression:' + chr(13) + ;
	"  Format('The balance for {0} on {1:F} is {2:C2}', lcUser, datetime(), lnBalance)" + ;
	chr(13) + chr(13) + ;
	'Result:' + chr(13) + ;
	'  ' + Format('The balance for {0} on {1:F} is {2:C2}', lcUser, datetime(), lnBalance), ;
	0, 'String.Format-like Syntax with Formatting')
messagebox('Expression:' + chr(13) + ;
	"  Format('The balance for {lcUser} on {datetime()} is {lnBalance}')" + ;
	chr(13) + chr(13) + ;
	'Result:' + chr(13) + ;
	'  ' + Format('The balance for {lcUser} on {datetime()} is {lnBalance}'), ;
	0, 'Interpolation')
messagebox('Expression:' + chr(13) + ;
	"  Format('The balance for {lcUser} on {datetime():F} is {lnBalance:C2}')" + ;
	chr(13) + chr(13) + ;
	'Result:' + chr(13) + ;
	'  ' + Format('The balance for {lcUser} on {datetime():F} is {lnBalance:C2}'), ;
	0, 'Interpolation with Formatting')
