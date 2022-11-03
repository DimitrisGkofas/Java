/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package server_onlyjava_2022;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class ClientHandler extends Thread{
    
    Socket client_socket;

    public ClientHandler(Socket client_socket)
    {
        this.client_socket = client_socket;
    }

    @Override
    public void run()
    {
        try
        {
            PrintWriter C_message_out = new PrintWriter(client_socket.getOutputStream(), true);

            BufferedReader C_message_in = new BufferedReader(new InputStreamReader(client_socket.getInputStream()));

            String recv_line;
            boolean remain=true;

            do{
                recv_line = C_message_in.readLine();
                C_message_out.println("Server_message: " + recv_line);
                if(recv_line==null || recv_line.equals("exit"))
                    remain=false;
            }while(remain);
        }
        catch (IOException IOex)
        {
            System.err.println("Error on port: " + IOex);
        }
    }
}
