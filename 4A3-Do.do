*setting up Stata

capture log close /* in case a log file is open from previous use */

cd "/Users/David/Desktop/4A03- Research
*MADDesktop
*cd "/Volumes/JDR" 
*cd "D:\" 

* changes Stata's default directory. The Default Directory is displayed 
* in the lower left of the "main" stata screen. 

log using Econ4A3-Research.log, replace text
capture drop _all
pause on

*ssc install outreg2 

*LOGCONTRACT VALUE
use "4A03-DATA"

gen ContractLength = 0 
replace ContractLength = ContractAV

*Regression Contract Value 
reg ContractValue TotalWAR, 
outreg using 4a3-1.doc, replace
reg ContractValue TotalWAR PlyAgeContract,  
outreg using 4a3-1.doc, merge
reg ContractValue TotalWAR PlyAgeContract pitcher,
outreg using 4a3-1.doc, merge
reg ContractValue TotalWAR PlyAgeContract pitcher ContractYr,
outreg using 4a3-1.doc, merge
reg ContractValue TotalWAR PlyAgeContract pitcher ContractYr ContractLength,
outreg using 4a3-1.doc, merge


*regression lnContractValue 

reg LnContractValue TotalWAR, 
outreg using 4a3-2.doc, replace
reg LnContractValue TotalWAR PlyAgeContract,  
outreg using 4a3-2.doc, merge
reg LnContractValue TotalWAR PlyAgeContract pitcher,
outreg using 4a3-2.doc, merge
reg LnContractValue TotalWAR PlyAgeContract pitcher ContractYr,
outreg using 4a3-2.doc, merge
reg ContractValue TotalWAR PlyAgeContract pitcher ContractYr ContractLength,
outreg using 4a3-2.doc, merge


pause

log close
