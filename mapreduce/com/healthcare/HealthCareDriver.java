package com.healthcare;



import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.LazyOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.MultipleOutputs;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;
import org.apache.hadoop.util.GenericOptionsParser;

//Driver Class
public class HealthCareDriver {

	public static void main(String[] args) throws Exception,InterruptedException, ClassNotFoundException
	{
		
		Configuration conf = new Configuration();
		
		GenericOptionsParser parser = new GenericOptionsParser(args);
		args = parser.getRemainingArgs();
		
		Job job = new Job(conf);
		
		job.setInputFormatClass(PdfInputFormat.class);
		job.setJarByClass(HealthCareDriver.class);
		job.setMapperClass(HealthCareMapper.class);
		job.setReducerClass(HealthCareReducer.class);
		
		job.setOutputFormatClass(TextOutputFormat.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(Text.class);

		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		LazyOutputFormat.setOutputFormatClass(job, TextOutputFormat.class);
		
		MultipleOutputs.addNamedOutput(job, "EmergencyCare", TextOutputFormat.class, Text.class, Text.class);
		MultipleOutputs.addNamedOutput(job, "SeasonalCare", TextOutputFormat.class, Text.class, Text.class);
		MultipleOutputs.addNamedOutput(job, "DengueCare", TextOutputFormat.class, Text.class, Text.class);
		MultipleOutputs.addNamedOutput(job, "WinterSeasonalCare", TextOutputFormat.class, Text.class, Text.class);
		MultipleOutputs.addNamedOutput(job, "GeneralCare", TextOutputFormat.class, Text.class, Text.class);
		
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}
