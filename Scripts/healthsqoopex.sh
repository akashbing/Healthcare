. ./health.properties
sqoop export --connect jdbc:mysql://localhost/POC_HEALTH --table Denguecare --export-dir /"$HEALTHPIGOP"/Dengueout/part-r-00000 --fields-terminated-by '\t';
sqoop export --connect jdbc:mysql://localhost/POC_HEALTH --table Emercare --export-dir /"$HEALTHPIGOP"/Emergencyout/part-r-00000 --fields-terminnated-by '\t';
sqoop export --connect jdbc:mysql://localhost/POC_HEALTH --table Wintercare --export-dir /"$HEALTHPIGOP"/Winterout/part-r-00000 --fields-terminated-by '\t';
sqoop export --connect jdbc:mysql://localhost/POC_HEALTH --table Seasonalcare --export-dir /"$HEALTHPIGOP"/Seasonalout/part-r-00000 --fields-terminated-by '\t';
sqoop export --connect jdbc:mysql://localhost/POC_HEALTH --table Generalcare --export-dir /"$HEALTHPIGOP"/Generalout/part-r-00000 --fields-terminated-by  '\t';


