package Group1.MyShell.grabJsonToSqlDatabase;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.json.JSONArray;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class grabJsonToSqlDatabase {
	public static void main(String[] args) throws IOException {
		String RootLocation = "./Json/";
		File file = new File(RootLocation);
		String[] currencyFolderNameList = file.list();
		File twdFile=new File(RootLocation+"TWD");
		String[] NumberOfTxtFile = twdFile.list();
		
		for(int count=0;count<NumberOfTxtFile.length;count++) {
			
		}
		
		
/*
 * 取得所有幣別的資料夾(USD,TWD)
 */
//		for (int i = 0; i < currencyFolderNameList.length; i++) {
//			String currencyFileLocation = RootLocation + currencyFolderNameList[i];
//			File currencyFile = new File(currencyFileLocation);
//			String[] jsonTxtFileList = currencyFile.list();
//
		/*
		 * 取得資料夾內的檔案
		 */
//			for (int j = 0; j < jsonTxtFileList.length; j++) {
//				String JsonWord;
//				ObjectMapper mapper = new ObjectMapper();
//				File jsonTxtFile = new File(currencyFileLocation + "/" + jsonTxtFileList[j]);
//				FileReader fileReader = new FileReader(jsonTxtFile);
//				BufferedReader br = new BufferedReader(fileReader);
//				StringBuffer sr = new StringBuffer();
//				while ((JsonWord = br.readLine()) != null) {
//					sr.append(JsonWord);
//				}
//				JsonNode node = mapper.readTree(sr.toString());
//				String dataNode = node.get("data").get("cryptoCurrencyList").toString();
//				JSONArray jArray = new JSONArray(dataNode);
//
		/*
		 * 將資料夾內的json.txt 遍歷
		 */
//				for (int k = 0; k < jArray.length(); k++) {
//					String name = node.get("data").get("cryptoCurrencyList").get(k).get("name").asText();
//					System.out.println(name);
//				}
//			}
//
//		}

	}


}
