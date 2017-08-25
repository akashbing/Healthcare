. ./health.properties              
echo "<<<<<<<<<<<<<==========Drop DATABASE if POC_HEALTHCARE already Existed==========>>>>>>>>>>>"
hive -e "drop database POC_HEALTHCARE;"             
echo "<<<<<<<<<<<<<==============CreatING POC_HEALTHCARE  Database ==================>>>>>>>>>>>>>>>>>>"
hive -e "create database POC_HEALTHCARE;"
hive -e "show databases;"
echo  " <<<<<<<<<<<<<<==============Database  Created=================>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#hive -e "use POC_HEALTHCARENEW2";
#hive -e "drop table IF EXISTS HIVE_EMCARE";
#hive -e "drop table IF EXISTS HIVE_SEASONAL";
#hive -e "drop table IF EXISTS HIVE_DENGUE";
#hive -e "drop table IF EXISTS HIVE_WINTER";
#hive -e "drop table IF EXISTS HIVE_GENERAL";

echo "<<<<<<<<<<<<<<================Creating HIVE_EMCERE External Table====================>>>>>>>>>>>>>>>>>>>>>>>>>"
hive -e "create external table POC_HEALTHCARE.HIVE_EMCARE(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string) row format delimited fields terminated by '\t' stored as textfile location '/"$HEALTHHIVEOP"/HIVE_EMCARE';"
echo "<<<<<<<<<<<<<================Loading data into HIVE_EMCARE================>>>>>>>>>>>>>>>>>>>>>>"
hive -e "load data  inpath '/"$HEALTHPIGOP"/Emergencyout/part-r-00000' into table POC_HEALTHCARE.HIVE_EMCARE;"
echo "<<<<<<<<<<<<<<================Creating HIVE_SEASONAL External Table====================>>>>>>>>>>>>>>>>>>>>>>>>>"
hive -e "create external table POC_HEALTHCARE.HIVE_SEASONAL(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string) row format delimited fields terminated by '\t' stored as textfile location '/"$HEALTHHIVEOP"/HIVE_SEASONAL';"
echo "<<<<<<<<<<<<<================Loading data into HIVE_SEASONAL================>>>>>>>>>>>>>>>>>>>>>>"
hive -e "load data  inpath '/"$HEALTHPIGOP"/Seasonalout/part-r-00000' into table POC_HEALTHCARE.HIVE_SEASONAL;"
echo "<<<<<<<<<<<<<<================Creating HIVE_DENGUE External Table====================>>>>>>>>>>>>>>>>>>>>>>>>>"
hive -e "create external table POC_HEALTHCARE.HIVE_DENGUE(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string) row format delimited fields terminated by '\t' stored as textfile location '/"$HEALTHHIVEOP"/HIVE_DENGUE';"
echo "<<<<<<<<<<<<<================Loading data into HIVE_DENGUE================>>>>>>>>>>>>>>>>>>>>>>"
hive -e "load data inpath '/"$HEALTHPIGOP"/Dengueout/part-r-00000' into table POC_HEALTHCARE.HIVE_DENGUE;"
echo "<<<<<<<<<<<<<<================Creating HIVE_GENERAL External Table====================>>>>>>>>>>>>>>>>>>>>>>>>>"
hive -e "create external table POC_HEALTHCARE.HIVE_GENERAL(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string) row  format delimited fields terminated by '\t' stored as textfile location '/"$HEALTHHIVEOP"/HIVE_GENERAL';"
echo "<<<<<<<<<<<<<================Loading data into HIVE_GENERAL================>>>>>>>>>>>>>>>>>>>>>>"
hive -e "load data inpath '/"$HEALTHPIGOP"/Generalout/part-r-00000' into table POC_HEALTHCARE.HIVE_GENERAL;"
echo "<<<<<<<<<<<<<<================Creating HIVE_WINTER External Table====================>>>>>>>>>>>>>>>>>>>>>>>>>"
hive -e "create external table POC_HEALTHCARE.HIVE_WINTER(pid int,pname string,page int,pgender string,pdisinfo string,phospital string,padate string,ploc string)  row format delimited fields terminated by '\t' stored as textfile location '/"$HEALTHHIVEOP"/HIVE_WINTER';"
echo "<<<<<<<<<<<<<================Loading data into HIVE_WINTER================>>>>>>>>>>>>>>>>>>>>>>"
hive -e "load data  inpath '/"$HEALTHPIGOP"/Winterout/part-r-00000' into table POC_HEALTHCARE.HIVE_WINTER;"




