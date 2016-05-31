/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import db.Database;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author aaron
 */
public class Notifier {
    
    static String ServerEmail="name@gmail.com";
    static String ServerName="smtp.gmail.com";
    static String ServerPassword="gmailpasssword";
    Session session;
    public Notifier()
    {
        Properties props = new Properties();  
  props.put("mail.smtp.host", "smtp.gmail.com");  
  props.put("mail.smtp.socketFactory.port", "587");  
  props.put("mail.smtp.socketFactory.class",  
            "javax.net.ssl.SSLSocketFactory");  
  props.put("mail.smtp.auth", "true");  
  props.put("mail.smtp.port", "587");  
  props.put("mail.smtp.starttls.enable", "true");
   
   session = Session.getInstance(props,  
   new javax.mail.Authenticator() {  
   @Override
   protected PasswordAuthentication getPasswordAuthentication() {  
   return new PasswordAuthentication(ServerEmail,ServerPassword);//change accordingly  
   }  
  });  
    }
    public void NotifySucess(String idate,String user_id,String job_id)
    {
        
  try{
      Database db=new Database();
      PreparedStatement GetUserEmail=db.conn.prepareStatement("select user_email from users where user_id=?");
      GetUserEmail.setString(1, user_id);
      ResultSet UserEmail=GetUserEmail.executeQuery();
      UserEmail.first();
      PreparedStatement GetJobName=db.conn.prepareStatement("select job_name from jobs where job_id=?");
      GetJobName.setString(1, job_id);
      ResultSet JobName=GetJobName.executeQuery();
      JobName.first();
      
    MimeMessage message = new MimeMessage(session);  
   message.setFrom(new InternetAddress(ServerEmail));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(UserEmail.getString("user_email")));  
   message.setSubject("Hello");  
   message.setText("Your profile has been shortlisted for the post of "+JobName.getString("job_name")+" Please be available for an interview on "+idate);  
     
   //send message  
   Transport.send(message);  
  }     catch (MessagingException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Notifier.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void NotifyReject(String user_id,String job_id)
    {
        try{
      Database db=new Database();
      PreparedStatement GetUserEmail=db.conn.prepareStatement("select user_email from users where user_id=?");
      GetUserEmail.setString(1, user_id);
      ResultSet UserEmail=GetUserEmail.executeQuery();
      UserEmail.first();
      PreparedStatement GetJobName=db.conn.prepareStatement("select job_name from jobs where job_id=?");
      GetJobName.setString(1, job_id);
      ResultSet JobName=GetJobName.executeQuery();
      JobName.first();
      
    MimeMessage message = new MimeMessage(session);  
   message.setFrom(new InternetAddress(ServerEmail));//change accordingly  
   message.addRecipient(Message.RecipientType.TO,new InternetAddress(UserEmail.getString("user_email")));  
   message.setSubject("Hello");  
   message.setText("Your profile has been rejected for the post of "+JobName.getString("job_name"));  
     
   //send message  
   Transport.send(message);  
  }     catch (MessagingException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Notifier.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
