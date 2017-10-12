
package yjc.wdb.awesome;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class uploadReviewFileUtils {
	
	private static final Logger logger=
			LoggerFactory.getLogger(uploadReviewFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception
	{
		//UUID uid = UUID.randomUUID();
		
		String savedName=originalName;
		//String savedName=originalName;

		String savedPath = calcPath(uploadPath);
		//String savedPath=uploadPath;
		
		File target= new File(savedPath,savedName);
		//File target= new File(savedPath,savedName);
		
		if(target.getParentFile().exists()==false)
		{
			target.getParentFile().mkdirs();
		}

		FileCopyUtils.copy(fileData, target);

		
		return savedPath+File.separator+savedName;
	}
	
	private static String calcPath(String uploadPath)
	{
		Calendar cal= Calendar.getInstance();
		
		String yearPath= File.separator+cal.get(Calendar.YEAR);
		
		String monthPath=new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath=new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String realPath=uploadPath+yearPath+monthPath+datePath;
		
		return realPath;
	}
	

	public static String extractImage(String videoFile, int position, String creatingImageFile, String post_id) 
	{
		try 
		{
			int seconds = position % 60;
			int minutes = (position - seconds) / 60;
			int hours = (position - minutes * 60 - seconds) / 60 / 60;

			String videoFilePath = videoFile; //
			String imageFilePath = creatingImageFile; //���옣寃쎈줈 �뼐�뒗 寃쎈줈媛� \ 濡� �릺�엳�뼱�꽌 �씠誘몄�媛� �븞�굹���궓..
			
			String destinationM = imageFilePath.replace("\\", "/");// 洹몃옒�꽌 \瑜� /濡� 諛붽퓭以��떎 �뼐濡� 
			// 洹몃옒�꽌 ���옣�� imageFilePath �뼐濡� �븯�뒗�뜲  �씠誘몄� 寃쎈줈 諛섑솚�� destinationM�뼐濡� �븿
			
			String[] commands = {"C:\\FFMPEG\\ffmpeg-3.3.2-win64-static\\ffmpeg-3.3.2-win64-static\\bin\\ffmpeg.exe ","-ss ",
					String.format("%02d:%02d:%02d", hours, minutes, seconds), 
					" -i ",videoFilePath," -an ","-vframes ","1 ","-y ",imageFilePath+"stilCut"+position+""+".jpeg" };
			String commandsCom = null;
			for(int i=0; i<commands.length; i++)
			{
				commandsCom+=commands[i];
				System.out.println(commandsCom);
			}
			String aa=commandsCom.substring(4);
			Process processor = Runtime.getRuntime().exec(aa);

			String line1 = null;

			BufferedReader error = new BufferedReader(new InputStreamReader(processor.getErrorStream()));
			
			while ((line1 = error.readLine()) != null) 
			{
				logger.debug(line1);
			}
			processor.waitFor();
			int exitValue = processor.exitValue();
			if (exitValue != 0) 
			{
				throw new RuntimeException("exit code is not 0 [" + exitValue+ "]");
			}
			
			return destinationM+"stilCut"+position+""+".jpeg";

		} 
		catch (IOException e) 
		{
			throw new RuntimeException(e);
		} 
		catch (InterruptedException e) 
		{
			throw new RuntimeException(e);
		}
	}
}
