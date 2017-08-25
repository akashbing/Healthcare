package com.healthcare;

import java.io.IOException;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

//Mapper class
public class HealthCareMapper extends Mapper<Object, Text, Text, Text> 
{
	
  protected void map(Object key, Text value, Context context)throws IOException, InterruptedException
	  {

    String[] record = value.toString().split(" ");
    String patId = record[0];
    String medicalRecord = record[1]+"\t"+record[2]+"\t"+record[3]+"\t"+record[4]+"\t"+record[5]+"\t"+record[6]+"\t"+record[7];

    context.write(new Text(patId), new Text(medicalRecord));
  }
 }
