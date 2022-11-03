/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client_2022;

import java.io.*;
import java.net.*;

public class Client_2022 {
    public static void main(String[] args) {
        String S_ip = "127.0.0.1";
        int S_port = 7072;
        
        try
        {
            Socket S_socket = new Socket(S_ip, S_port);
            PrintWriter sent_message = new PrintWriter(S_socket.getOutputStream(), true);
            BufferedReader recv_message = new BufferedReader(new InputStreamReader(S_socket.getInputStream()));
            BufferedReader user_message = new BufferedReader(new InputStreamReader(System.in));
            
            String user_buffer;
            System.out.println("Type a message to sent: ");
            
            while((user_buffer = user_message.readLine()) != null)
            {
                sent_message.println(user_buffer);
                
                System.out.println(recv_message.readLine());
                
                if(user_buffer.equals("exit"))
                    break;
                
            }
        }
        catch(IOException IOex)
        {
            System.err.println("Error at I/O: " + IOex);
            System.exit(1);
        }
    }
}
