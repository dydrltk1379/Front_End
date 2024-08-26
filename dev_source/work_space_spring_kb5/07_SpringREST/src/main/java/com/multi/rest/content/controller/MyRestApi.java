package com.multi.rest.content.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class MyRestApi {
	public static String MyURL = "http://localhost/rest/catWeb";
	
	public static void main(String[] args) {
		StringBuffer urlBuffer = new StringBuffer();
		urlBuffer.append(MyURL);
		System.out.println(urlBuffer);
		try {
			URL url = new URL(urlBuffer.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");
			int code = conn.getResponseCode();
			System.out.println("ResponseCode : " + code);
			
			if(code < 200 || code > 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return;
			}
			
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(br);
			JSONArray catList = (JSONArray) jsonObj.get("list");
			
			for(int i = 0; i < catList.size(); i++) {
				JSONObject cat = (JSONObject) catList.get(i);
				System.out.println("id : " + cat.get("id"));
				System.out.println("name : " + cat.get("name"));
				System.out.println("info : " + cat.get("info"));
				System.out.println("eyeColor : " + cat.get("eyeColor") + "\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
