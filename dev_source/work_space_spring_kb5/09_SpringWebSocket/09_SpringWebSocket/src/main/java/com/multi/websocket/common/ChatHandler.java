package com.multi.websocket.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Component("chatHandler")
public class ChatHandler extends TextWebSocketHandler {

	private Vector<WebSocketSession> memberList;
	private ConcurrentHashMap<String, WebSocketSession> map;

	public ChatHandler() {
		memberList = new Vector<>();
		map = new ConcurrentHashMap<String, WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결 성공!!");
		//
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//
	}

	public void boardCastMessage(String id ,String msg){
		for(String key : map.keySet()) {
			try {
				WebSocketSession ws = map.get(key);
				if(!ws.isOpen()) {
					map.remove(key);
					continue;
				}
				ws.sendMessage(new TextMessage(id + " : " + msg));
			} catch (Exception e) {}
		}
	}

	public void privateMessage(String sendId, String msg, String target){
		WebSocketSession ws = map.get(target);
		if (ws != null) {
			try {
				if(!ws.isOpen()) {
					map.remove(target);
				}else {
					ws.sendMessage(new TextMessage(sendId + " : "+msg));
				}
			} catch (Exception e) {}
		}
	}

	//연결이 끊겼을 때 동작하는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 종료!!");
		memberList.remove(session);
	}
}
