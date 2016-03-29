*setting up Stata

capture log close /* in case a log file is open from previous use */

cd "/Users/David/Desktop/4A03- Research
*MacDesktop
*cd "/Volumes/JDR" 
*USB MAC
*cd "D:\"
*USB Lab 

log using Econ4A3-Research.log, replace text
capture drop _all
pause on

*import delimited data 
// imports CSV than you save into .dta file

use "Data1"

// Variable Generation // 
// Only run this once if you save .dta file 

gen pitcher = position == "P" 
gen fivewar = war1 + war2 + war3 + war4 +war5

gen LnContractValue = 0 
replace LnContractValue = ln(contractvalue)

g Pitcher =0
replace Pitcher = 1 if plyrpost == 1

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
