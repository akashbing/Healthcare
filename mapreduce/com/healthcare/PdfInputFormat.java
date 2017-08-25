package com.healthcare;


import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;

public class PdfInputFormat extends FileInputFormat<LongWritable, Text> 
{

	public RecordReader<LongWritable, Text> createRecordReader(	org.apache.hadoop.mapreduce.InputSplit arg0,
		                                                    	org.apache.hadoop.mapreduce.TaskAttemptContext arg1)
		                                                    	throws IOException, InterruptedException 
		{
		
		return new PdfRecordReader();
	}
}