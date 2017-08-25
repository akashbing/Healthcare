
#hive -e "use POC_HEALTHCARE;"
hive -e "select * from POC_HEALTHCARE.HIVE_WINTER;"
hive -e "select * from POC_HEALTHCARE.HIVE_EMCARE;"
hive -e "select * from POC_HEALTHCARE.HIVE_SEASONAL;"
hive -e "select * from POC_HEALTHCARE.HIVE_GENERAL;"
hive -e "select * from POC_HEALTHCARE.HIVE_DENGUE;"
