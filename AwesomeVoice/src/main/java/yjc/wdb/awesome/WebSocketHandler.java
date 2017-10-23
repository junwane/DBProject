package yjc.wdb.awesome;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.WebSocketSession;

@ServerEndpoint("/fileserver")
public class WebSocketHandler {
	

    static File uploadedFile = null;
    static String fileName = null;
    static FileOutputStream fos = null;
    final static String filePath="d:/download/";
    
    private static final java.util.Set<Session> sessions = java.util.Collections.synchronizedSet(new java.util.HashSet<Session>());

    @OnOpen
    public void open(Session session, EndpointConfig conf) {
        System.out.println("chat ws server open");
        System.out.println("세션 ID : " + session.getId());
        
    }

    @OnMessage
    public void processUpload(ByteBuffer msg, boolean last, Session session) {
        System.out.println("Binary Data");      

        while(msg.hasRemaining()) {         
            try {
                fos.write(msg.get());
            } catch (IOException e) {               
                e.printStackTrace();
            }
        }
        

    }

    @OnMessage
    public void message(Session session, String msg) {
    	System.out.println("세션 ID : "+ session.getId()+ ", 내용 : " + msg);
    	
    	try{
    		final Basic basic = session.getBasicRemote();
    		basic.sendText(msg);
    	}catch(IOException e){
    		e.printStackTrace();
    	}
        

//        if(!msg.equals("end")) {
//            fileName=msg.substring(msg.indexOf(':')+1);
//            uploadedFile = new File(filePath+fileName);
//            try {
//                fos = new FileOutputStream(uploadedFile);
//            } catch (FileNotFoundException e) {     
//                e.printStackTrace();
//            }
//        }else {
//            try {
//                fos.flush();
//                fos.close();                
//            } catch (IOException e) {       
//                e.printStackTrace();
//            }
//        }
    }

    @OnClose
    public void close(Session session, CloseReason reason) {
        System.out.println("socket closed: "+ reason.getReasonPhrase());
    }

    @OnError
    public void error(Session session, Throwable t) {
        t.printStackTrace();

    }
    

}