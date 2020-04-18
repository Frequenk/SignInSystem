package com.websocket;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/**
 * Created by liuxn on 2018/5/22 0022.
 */
@Service("MyHandler")
public class MyHandler extends TextWebSocketHandler {
    //在线用户列表
    private static final Map<String, WebSocketSession> users;
    //用户标识
    private static final String CLIENT_ID = "userId";

    static {
        users = new HashMap<>();
    }

    @Override//连接后触发的回调
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("成功建立连接");
        System.out.println("wesocketsession:"+session.toString());
        String userId = getClientId(session);
        if (userId != null) {
            users.put(userId, session);
            System.out.println("users.HashMap="+users.toString());
			/*
			 * session.sendMessage(new TextMessage("你已成功建立socket连接"));
			 */            System.out.println(userId);
            System.out.println(session);
        }
    }

    @Override//收到消息时触发的回调
    public void handleTextMessage(WebSocketSession session, TextMessage message) {
        // ...
        System.out.println("收到客户端消息:"+message.getPayload());
        System.out.println("users.HashMap="+users.toString());
		/*
		 * WebSocketMessage message1 = new TextMessage("server:"+message); try {
		 * session.sendMessage(message1); } catch (IOException e) { e.printStackTrace();
		 * }
		 */
    }

    @Override//传输错误时触发的回调
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        if (session.isOpen()) {
            session.close();
        }
        System.out.println("连接出错");
        users.remove(getClientId(session));
    }

    @Override//连接断开后触发的回调
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("连接已关闭：" + status);
        users.remove(getClientId(session));
    }

    /**
     * 发送信息给指定用户
     * @param clientId
     * @param message
     * @return
     */
    public boolean sendMessageToUser(String clientId, TextMessage message) {
        if (users.get(clientId) == null) return false;
        WebSocketSession session = users.get(clientId);
        System.out.println("sendMessage:" + session+",msg:"+message.getPayload());
        if (!session.isOpen()) return false;
        try {
            session.sendMessage(message);
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 广播信息
     * @param message
     * @return
     */
    public boolean sendMessageToAllUsers(TextMessage message) {
        boolean allSendSuccess = false;
        Set<String> clientIds = users.keySet();
        WebSocketSession session = null;
        for (String clientId : clientIds) {
            try {
                session = users.get(clientId);
                if (session.isOpen()) {
                    session.sendMessage(message);
                }
            } catch (IOException e) {
                e.printStackTrace();
                allSendSuccess = false;
            }
        }

        return  allSendSuccess;
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }

    /**
     * 获取用户标识
     * @param session
     * @return
     */
    private String getClientId(WebSocketSession session) {
    	System.out.println("session,session,session");
    	System.out.println("session"+session.getAttributes().get(CLIENT_ID).toString());
        try {
            String clientId = session.getAttributes().get(CLIENT_ID).toString();
            return clientId;
        } catch (Exception e) {
            return null;
        }
    }
}