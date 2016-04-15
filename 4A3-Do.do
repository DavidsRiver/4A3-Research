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


g adjustedcv = contractvalue*(1.04736^(2016-contractyr))
gen pitcher = position == "P" 
gen fivewar = war1 + war2 + war3 + war4 +war5

gen lncontractvalue = 0 
replace lncontractvalue = ln(contractvalue)

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
