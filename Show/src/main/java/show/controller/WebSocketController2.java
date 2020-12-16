package show.controller;

import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.RemoteEndpoint.Basic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import show.service.face.AllimService;
import show.service.impl.AllimServiceImpl;

@Controller
@ServerEndpoint(value="/allimSocket")
public class WebSocketController2 {
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketController2.class);
    @Autowired AllimService allimService = new AllimServiceImpl();
    public WebSocketController2() {
    	logger.info("웹소켓(서버) 객체생성");
    }

    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            //열자마자 여기로 옴, 여기서 조회?
//            allimService.
//            basic.sendText("관리자 : 대화방에 연결 되었습니다.");
            
            
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message) {
    	
        try {
            for(Session session : WebSocketController2.sessionList) {
                if(!self.getId().equals(session.getId())) {
//                    session.getBasicRemote().sendText(sender+" : "+message);
//                	session.getBasicRemote().sendText("관리자 : "+message);
                }
            }
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	logger.info("메세지 : "+message);
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            
//            if (message != null && message.length() !=0) {
//            	basic.sendText(message); 
//			}
            
        }catch (Exception e) {
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message);
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
    
}
