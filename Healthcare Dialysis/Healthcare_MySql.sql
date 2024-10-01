create database Project_154;
use Project_154;
select * from dialysis_1;

# 1. Number of Patients across various summaries

select sum(Number_of_patients_included_in_the_transfusion_summary) as Transfusion_summary, 
sum(Number_of_patients_in_hypercalcemia_summary) as Hypercalcemia_summary, 
sum(Noof_patients_Serum_phosphorus_summary) as Serum_phosphorus,
sum(No_of_patients_included_in_hospitalization_summary) as Hospitalization_summary,
sum(No_of_Patients_included_in_survival_summary) as survival_summary,
sum(Number_of_Patients_included_in_fistula_summary) as fistula_summary,
sum(Number_of_patients_in_long_term_catheter_summary) as catheter_summary,
sum(Number_of_patients_in_nPCR_summary) as nPCR_summary from dialysis_1;
#_________________________________________________________________________________________________________________________

# 2. Profit Vs Non-Profit Stats

select count( case when Profit_or_Non_Profit="Profit" then  Profit_or_Non_Profit end) as profit, 
count( case when Profit_or_Non_Profit="Non-Profit" then  Profit_or_Non_Profit end) as Non_profit from dialysis_1;

#________________________________________________________________________________________________________________________

# 3. Top 3 Chain Organizations in terms of no. of dialysis stations
select Chain_Organization, sum(No_of_Dialysis_Stations) as nds from dialysis_1 group by Chain_Organization order by nds desc limit 3;
#_________________________________________________________________________________________________________________________________
# 4. Dialysis Stations Stats
select Facility_Name, sum(No_of_Dialysis_Stations) as Total_DS from dialysis_1 group by Facility_Name order by Total_DS desc limit 5;


#__________________________________________________________________________________________________________________________________
# 5. # of Category Text  - As Expected

select count( case when Patient_hospitalization_category_text="As Expected" then Patient_hospitalization_category_text end) as Hospitalization, 
count( case when Patient_Survival_Category_Text="As Expected" then  Patient_Survival_Category_Text end) as Survival, 
count( case when Patient_Infection_category_text="As Expected" then  Patient_Infection_category_text end) as Infection,
count( case when Fistula_Category_Text="As Expected" then  Fistula_Category_Text end) as Fistula,
count( case when SWR_category_text="As Expected" then  SWR_category_text end) as SWR,
count( case when PPPW_category_text="As Expected" then  PPPW_category_text end) as PPPW,
count( case when Patient_Transfusion_category_text="As Expected" then  Patient_Transfusion_category_text end) as Transfusion
from dialysis_1;


#________________________________________________________________________________________________________________________________________
select * from dialysis_2;
# 6. # of Score Applied – Improvement
select count( case when VAT_Catheter_MSA="Improvement" then VAT_Catheter_MSA end) as VAT_Catheter_MSA,
count( case when VAT_Fistula_MSA="Improvement" then  VAT_Fistula_MSA end) as VAT_Fistula_MSA, 
count( case when Kt_V_Comprehensive_MSA="Improvement" then  Kt_V_Comprehensive_MSA end) as Comprehensive_MSA,
count( case when Hypercalcemia_MSA="Improvement" then  Hypercalcemia_MSA end) as Hypercalcemia_MSA,
count( case when NHSN_BSI_MSA="Improvement" then  NHSN_BSI_MSA end) as NHSN_BSI_MSA,
count( case when ICH_CAHPS_MSA="Improvement" then  ICH_CAHPS_MSA end) as ICH_CAHPS_MSA,
count( case when ICH_CAHPS_Neph_Comm_Caring_MSA="Improvement" then  ICH_CAHPS_Neph_Comm_Caring_MSA end) as ICH_CAHPS_Neph_Comm_Caring_MSA,
count( case when ICH_CAHPS_Quality_of_Dialysis_Care_Ops_MSA="Improvement" then  ICH_CAHPS_Quality_of_Dialysis_Care_Ops_MSA end) as ICH_CAHPS_Quality_of_Dialysis_Care_Ops_MSA,
count( case when ICH_CAHPS_Providing_Info_to_Patients_MSA="Improvement" then  ICH_CAHPS_Providing_Info_to_Patients_MSA end) as ICH_CAHPS_Providing_Info_to_Patients_MSA,
count( case when ICH_CAHPS_Overall_Rating_of_Neph_MSA="Improvement" then  ICH_CAHPS_Overall_Rating_of_Neph_MSA end) as ICH_CAHPS_Overall_Rating_of_Neph_MSA,
count( case when ICH_CAHPS_Overall_Rating_of_Dialysis_Staff_MSA="Improvement" then  ICH_CAHPS_Overall_Rating_of_Dialysis_Staff_MSA end) as ICH_CAHPS_Overall_Rating_of_Dialysis_Staff_MSA,
count( case when ICH_CAHPS_Overall_Rating_of_Dialysis_Facility_MSA="Improvement" then ICH_CAHPS_Overall_Rating_of_Dialysis_Facility_MSA end) as ICH_CAHPS_Overall_Rating_of_Dialysis_Facility_MSA,
count( case when SRR_MSA="Improvement" then  SRR_MSA end) as SRR_MSA,
count( case when STrR_MSA="Improvement" then  STrR_MSA end) as STrR_MSA,
count( case when SHR_MSA="Improvement" then  SHR_MSA end) as SHR_MSA
from dialysis_2;
#______________________________________________________________________________________________________________________________________________________________________________
# 7. Top 3 Facilities in terms of Total Performance Score

select ï»¿Facility_Name, sum(Total_Performance_Score) as performance_score from dialysis_2 group by ï»¿Facility_Name order by performance_score desc limit 3;
#____________________________________________________________________________________________________________________________________________________________

# 8. Average Payment Reduction Rate

select round(Avg(PY2020_Payment_Reduction_Percentage)*100,2) as Payment_Reduction_Rate from dialysis_2;
#________________________________________________________________________________________________________________________________________________