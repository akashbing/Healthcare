package com.healthcare;


import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.lib.input.FileSplit;
import org.apache.hadoop.mapreduce.RecordReader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.apache.hadoop.mapreduce.InputSplit; 
import org.apache.hadoop.mapreduce.TaskAttemptContext;

public class PdfRecordReader extends RecordReader <LongWritable, Text>{
	
	private String[] lines = null;
	private LongWritable key = null;
	private Text value = null;
	
	public void initialize(InputSplit genericSplit,TaskAttemptContext context)throws IOException, InterruptedException 
			{
	
    FileSplit split = (FileSplit)genericSplit;
    Configuration job = context.getConfiguration();
    final Path file = split.getPath();

    /*Logic for opening the file and seek to the start of the split. 
      Here we are applying the Pdf Parsing logic */

     FileSystem fs = file.getFileSystem(job);
     FSDataInputStream fileIn = fs.open(split.getPath());
     PDDocument pdf = null;
     String parsedText = null;
     PDFTextStripper stripper;
     pdf = PDDocument.load(fileIn);
     stripper = new PDFTextStripper();
     parsedText = stripper.getText(pdf);
     this.lines = parsedText.split("\n");

    }
	
	
	public boolean nextKeyValue() throws IOException, InterruptedException 
	{
		if (key == null) 
		{
			key = new LongWritable();
			key.set(1);
			value = new Text();
			value.set(lines[0]);
		}
		else
		{
			int temp = (int) key.get();
			if (temp < (lines.length ))
			{
				int count = (int) key.get();
				value = new Text();
				value.set(lines[count]);
				count = count + 1;
				key = new LongWritable(count);
			}
			else
			{
				return false;
			}

		}
		if (key == null || value == null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}

	
	public LongWritable getCurrentKey() throws IOException, InterruptedException
	{
				return key;// TODO Auto-generated method stub

	}
	
	
	public Text getCurrentValue() throws IOException,InterruptedException 
	{
		return value; 	// TODO Auto-generated method stub
		
	}
	
	
	public float getProgress() throws IOException, InterruptedException 
	{
		return 0;
	}
	
	
	public void close() throws IOException{	}

}

