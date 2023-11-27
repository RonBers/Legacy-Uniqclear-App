/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.uniqclear.uniqclearapp;
import com.formdev.flatlaf.FlatLightLaf;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import lognDashboardPackage.loginPage;
/**
 *
 * @author ronjoshual.bersabal
 */
public class UniqclearApp {

   
    
    public static void main(String[] args) {
        
        //com.sun.java.swing.plaf.windows.WindowsLookAndFeel
        //javax.swing.plaf.nimbus.NimbusLookAndFeel
        //com.sun.java.swing.plaf.motif.MotifLookAndFeel
        try{
            //UIManager.setLookAndFeel("javax.swing.plaf.nimbus.NimbusLookAndFeel");
            UIManager.setLookAndFeel( new FlatLightLaf() );
        }catch(Exception ex){
               System.out.println("Error: " +ex.getMessage());
        }
        
        
        loginPage login =  new loginPage();
        login.setVisible(true);
        
    }
    
    

}
