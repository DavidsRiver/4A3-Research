cd "/Users/David/Downloads/4A3-Research-master 6"
import delimited MasterData 

*Variable Generation 

replace war1 = 0 if war1 ==.
replace war2 = 0 if war2 ==.
replace war3 = 0 if war3 ==.
replace war4 = 0 if war4 ==.
replace war5 = 0 if war5 ==.
replace war6 = 0 if war6 ==.
replace war7 = 0 if war7 ==.
replace war8 = 0 if war8 ==.
replace war9 = 0 if war9 ==.
replace war10 = 0 if war10 ==.
replace war11 = 0 if war11 ==.
replace war12 = 0 if war12 ==.

gen lncontractvalue = 0 
replace lncontractvalue = ln(contractvalue)
g adjustedcv = contractvalue*(1.04736^(2016-contractyr))
g lnadjustedcv = ln(adjustedcv) 
gen pitcher = position == "P" 

gen tenwar = war1 + war2 + war3 + war4 +war5 +war6 +war7 +war8 + war9 +war10 
gen ninewar = war1 + war2 + war3 + war4 +war5 +war6 +war7 +war8 + war9
gen eightwar = war1 + war2 + war3 + war4 +war5 +war6 +war7 +war8
gen sevenwar = war1 + war2 + war3 + war4 +war5 +war6 +war7
gen sixwar = war1 + war2 + war3 + war4 +war5 +war6
gen fivewar = war1 + war2 + war3 + war4 +war5
gen fourwar =  war1 + war2 + war3 + war4
gen threewar =  war1 + war2 + war3 
gen twowar =  war1 + war2



reg adjustedcv fivewar optout pitcher agecontract  if fivewar > 0
 graph twoway (scatter adjustedcv fivewar if optout==0) (scatter adjustedcv fivewar if optout==1, mlabel(name))  if fivewar > 0



gen avgcontract = contractvalue/contractlength
gen adjavgcontract = adjustedcv/contractlength

*when in a year does 
gen whenoptout = optoutyear - contractyr if optout == 1
replace whenoptout = 0 if whenoptout == .

gen optoutvalue = 1/whenoptout 
replace optoutvalue = 0 if optoutvalue ==.

reg avcontract fivewar optoutvalue agecontract  if fivewar > 0
reg adjavgcontract fivewar optoutvalue agecontract  if fivewar > 0


// Visualization 

graph twoway (scatter contractvalue fivewar if optout==0) (scatter contractvalue fivewar if optout==1)
// produces graph contractvalue, fivewar

graph twoway (scatter contractvalue fivewar if pitcher==0) (scatter contractvalue fivewar if pitcher==1)
// produces graph contractvalue fivewar , 




// Regressions 
// Contract Value 
// Outreg produces Research Tables 

reg contractvalue totalwar 
outreg using ContractV.doc, replace 
reg contractvalue totalwar plyagecontract
outreg using ContractV.doc, merge
reg contractvalue totalwar plyagecontract Pitcher
outreg using ContractV.doc, merge
reg contractvalue totalwar plyagecontract Pitcher contractyr
outreg using ContractV.doc, merge
reg contractvalue totalwar plyagecontract Pitcher contractyr contractlength 
outreg using ContractV.doc, merge


//LnContractValue 
reg LnContractValue totalwar 
outreg using LnContractV.doc, replace 
reg LnContractValue totalwar plyagecontract
outreg using LnContractV.doc, merge
reg LnContractValue totalwar plyagecontract Pitcher
outreg using LnContractV.doc, merge
reg LnContractValue totalwar plyagecontract Pitcher contractyr
outreg using LnContractV.doc, merge
reg LnContractValue totalwar plyagecontract Pitcher contractyr contractlength 
outreg using LnContractV.doc, merge


log close
