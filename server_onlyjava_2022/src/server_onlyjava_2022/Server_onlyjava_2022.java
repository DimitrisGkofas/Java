/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server_onlyjava_2022;

import java.io.*;
import java.net.*;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class Server_onlyjava_2022 {

    public static void main(String[] args){
        int port = 7072;
        
        if(args.length == 0)
        {
           System.out.println("Default port: " + port);
        }
        else
        {
            port = Integer.parseInt(args[0]);
            System.out.println("port set to: " + port);
        }
        
        
        
        try
        {
            System.out.println("The server is running");
            
            ServerSocket S_Socket = new ServerSocket(port);
            
            ArrayList<ClientHandler> clientList=new ArrayList<>();
            
            while(true)
            {
                Socket C_Socket = S_Socket.accept();
                InetSocketAddress socketAddress = (InetSocketAddress) C_Socket.getRemoteSocketAddress();
                String clientIpAddress = socketAddress.getAddress().getHostAddress();
                System.out.println("My courent client ip is : "+clientIpAddress);
                
                ClientHandler routine = new ClientHandler(C_Socket);
                clientList.add(routine);
                clientList.get(0).start();
            } 
        }
        catch (IOException IOex) {
            System.err.println("Error on port: " + IOex);
        }
        System.out.println("server stoped"); 
    }
    
}


