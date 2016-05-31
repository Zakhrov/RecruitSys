/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author aaron
 */
public class JStatusParser {
    public static String ParseStatus(int x)
    {
        
        switch(x)
        {
            case 0: return "Applied";
            
            
            case 1: return "Viewed";
            
            case 2: return "Shortlisted";
            
            case 3: return "Rejected";
            
            
        }
        return  null;
    }
    
}
