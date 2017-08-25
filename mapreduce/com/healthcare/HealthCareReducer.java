package com.healthcare;


import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.output.MultipleOutputs;

//Reducer Class
public class HealthCareReducer extends Reducer<Text, Text, Text, Text> 
{
	
	MultipleOutputs<Text,Text> mos;
	
	public void setup(Context context)
	{
		mos = new MultipleOutputs<Text,Text>(context);
	}
	
	protected void reduce (Text key, Iterable<Text> values,	Context context) throws IOException, InterruptedException 
	{
		
		String name = "";
		int age  = 0;	
		String gender = "";
		String diseaseInfo = "";
		String address = "";
		String hospital = "";
		String admitDate = "";
		String record = "";
		SimpleDateFormat df =new SimpleDateFormat("yyyy-MM-dd");
		Date admitDateParsed = null, date1 = null, date2 = null, date3 = null, date4 = null;
		
		for (Text value : values) {
			String[] recordSplit = value.toString().split("\t");
			
			name =  recordSplit[0];
			age  = Integer.parseInt(recordSplit[1]);
			gender = recordSplit[2];
			diseaseInfo = recordSplit[3];
			hospital = recordSplit[4];
			admitDate = recordSplit[5];
			address = recordSplit[6];
             
			record = name+"\t"+age+"\t"+gender+"\t"+diseaseInfo+"\t"+hospital+"\t"+admitDate+"\t"+address;

			try {
			admitDateParsed = df.parse(admitDate);
			date1 = df.parse("2015-03-31");
			date2 = df.parse("2015-07-31");
			
			date3 = df.parse("2015-08-31");
			date4 = df.parse("2016-01-01");
			
	    } catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if((age > 35  && age < 50) && gender.equalsIgnoreCase("Male")){	
		    if(diseaseInfo.equalsIgnoreCase("Cancer") || diseaseInfo.equalsIgnoreCase("TB"))
		    {
			    mos.write("EmergencyCare", key, new Text(record) );
		    }
		  // ADMITED_DATE IN BETWEEN 2015-04-01 to 2015-07-31 
		    else  if((admitDateParsed.after(date1)) && (admitDateParsed.before(date2))){
		    	mos.write("SeasonalCare", new Text(key), new Text(record));
		    }
		    else{
				mos.write("GeneralCare", new Text(key), new Text(record));
			}
		}
		
		else if(age > 50 && (gender.equalsIgnoreCase("Male") || gender.equalsIgnoreCase("Female"))){
 		   if(address.contains("Jharkhand")){
 			  mos.write("DengueCare", new Text(key), new Text(record));
 		   }
 		   // ADMITED_DATE IN BETWEEN 2015-09-01 to 2015-12-31
 		   else if((admitDateParsed.after(date3)) && (admitDateParsed.before(date4))){
			   mos.write("WinterSeasonalCare", new Text(key), new Text(record));
 		   }
 		   else {
 				mos.write("GeneralCare", new Text(key), new Text(record));
 			}
		}
		else {
		     mos.write("GeneralCare", new Text(key), new Text(record));
		}
     }
	}
	
	 protected void cleanup(Context context) throws IOException, InterruptedException {
		   mos.close();
	}
	}
