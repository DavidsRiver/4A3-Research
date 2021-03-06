cd "/Users/David/Downloads/4A3-Research-master 6"
import delimited MasterData 

*Variable Generation 

gen foreign = 1 if war1 ==. 
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
g adjustedcv = contractvalue*(1.060549)^(2016-contractyr)
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
gen onewar = war1 


gen avgcontract = contractvalue/contractlength
gen adjavgcontract = adjustedcv/contractlength

*when in a year does 
gen whenoptout = optoutyear - contractyr if optout == 1
replace whenoptout = 0 if whenoptout == .

gen optoutvalue = 1/whenoptout 
replace optoutvalue = 0 if optoutvalue ==.


// WHICH WAR to use?

reg adjustedcv onewar 
outreg using WhichWAR.doc, replace 
reg adjustedcv twowar
outreg using WhichWAR.doc, merge
reg adjustedcv threewar
outreg using WhichWAR.doc, merge
reg adjustedcv fourwar
outreg using WhichWAR.doc, merge
reg adjustedcv fivewar 
outreg using WhichWAR.doc, merge
reg adjustedcv sixwar
outreg using WhichWAR.doc, merge
reg adjustedcv sevenwar
outreg using WhichWAR.doc, merge
reg adjustedcv eightwar
outreg using WhichWAR.doc, merge
reg adjustedcv ninewar 
outreg using WhichWAR.doc, merge
reg adjustedcv tenwar
outreg using WhichWAR.doc, merge

// SUMMARY STATISTICS 

sum agecontract whenoptout contractyr contractlength adjustedcv pitcher avgcontract if optout == 1 
sum war1 twowar threewar fourwar fivewar sixwar sevenwar eightwar ninewar tenwar if optout == 1 & fivewar > 0

// 1st Model  (1) Salary = Salaryi = β0 + β1 Age +β2 WAR + β3 Position + β4PlayerOption + εi

reg adjustedcv fivewar optout if fivewar >0, vce(robust)
outreg using model1.doc, replace 
reg adjustedcv fivewar optout agecontract if fivewar >0 ,vce(robust)
outreg using model1.doc, merge
reg adjustedcv fivewar optout agecontract pitcher if fivewar >0 ,vce(robust)
outreg using model1.doc, merge


// 2nd Model (2) Ln(Salary) =β0 + β1 Age +β2 WAR + β2 Position + β3PlayerOption + εi 
reg lnadjustedcv fivewar optout if fivewar >0, vce(robust)
outreg using model2.doc, replace 
reg lnadjustedcv fivewar optout agecontract if fivewar >0 ,vce(robust)
outreg using model2.doc, merge
reg lnadjustedcv fivewar optout agecontract pitcher if fivewar >0 ,vce(robust)
outreg using model2.doc, merge

// 3rd Model (3) AVGSalaryi = β0 + β1 Age +β2 WAR + β3 Position + β4PlayerOptionYears + εi (3)
reg adjavgcontract fivewar optoutvalue if fivewar > 0 ,vce(robust)
outreg using model3.doc, replace 
reg adjavgcontract fivewar optoutvalue agecontract if fivewar >0 ,vce(robust)
outreg using model3.doc, merge
reg adjavgcontract fivewar optoutvalue agecontract pitcher if fivewar >0 ,vce(robust)
outreg using model3.doc, merge


Problems
graph twoway (scatter adjustedcv fivewar if optout==0) (scatter adjustedcv fivewar if optout==1, mlabel(name))  if fivewar > 0
reg adjustedcv fivewar if optout == 0 ,vce(robust)
reg adjustedcv fivewar if optout == 1 ,vce(robust)

reg avcontract fivewar optoutvalue agecontract  if fivewar > 0
reg adjavgcontract fivewar optoutvalue agecontract  if fivewar > 0

