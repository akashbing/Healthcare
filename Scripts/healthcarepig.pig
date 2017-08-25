                                                                           
. ./health.properties
echo "$HEALTHMROP"
pig -e "A = LOAD '/"$HEALTHMROP"/EmergencyCare-r-00000' using PigStorage('\t') as (pid:int,pname:chararray,page:int,pgender:chararray,pdisinfo:chararray,phospital:chararray,padate:chararray,ploc:chararray); desa = distinct A ;odra = order desa By pid; store odra into '/"$HEALTHPIGOP"/Emergencyout';"
pig -e "B = LOAD '/"$HEALTHMROP"/SeasonalCare-r-00000' using PigStorage('\t') as (pid:int,pname:chararray,page:int,pgender:chararray,pdisinfo:chararray,phospital:chararray,padate:chararray,ploc:chararray); desb = distinct B; odrb = order desb By pid; store odrb into '/"$HEALTHPIGOP"/Seasonalout';"
pig -e "C = LOAD '/"$HEALTHMROP"/DengueCare-r-00000' using PigStorage('\t') as (pid:int,pname:chararray,page:int,pgender:chararray,pdisinfo:chararray,phospital:chararray,padate:chararray,ploc:chararray); deso = distinct C ;odrc = order deso By pid ;store odrc into '/"$HEALTHPIGOP"/Dengueout';"
pig -e "D = LOAD '/"$HEALTHMROP"/WinterSeasonalCare-r-00000' using PigStorage('\t') as (pid:int,pname:chararray,page:int,pgender:chararray,pdisinfo:chararray,phospital:chararray,padate:chararray,ploc:chararray); desd = distinct D ;odrd = order desd By pid; store odrd into '/"$HEALTHPIGOP"/Winterout';"
pig -e "E = LOAD '/"$HEALTHMROP"/GeneralCare-r-00000' using PigStorage('\t') as (pid:int,pname:chararray,page:int,pgender:chararray,pdisinfo:chararray,phospital:chararray,padate:chararray,ploc:chararray); desr = distinct E; odre = order desr By pid; store odre into '/"$HEALTHPIGOP"/Generalout';"



















