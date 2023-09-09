/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package customerPackage;

import com.mysql.cj.util.StringUtils;
import connectionSql.mysqlConnection;
import java.awt.Color;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author User
 */
public class customerPage extends javax.swing.JFrame {
    
    Connection con = new mysqlConnection().getCon(); 
    
    /**
     * Creates new form customerPage
     */
    public customerPage(){
        initComponents();
    }
        
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        headerlogo = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jPanel3 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        customerTable = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        editCustomer = new javax.swing.JButton();
        removeCustomer = new javax.swing.JButton();
        homeButton = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Customers");
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowOpened(java.awt.event.WindowEvent evt) {
                formWindowOpened(evt);
            }
        });

        jPanel1.setBackground(new java.awt.Color(204, 204, 204));
        jPanel1.setPreferredSize(new java.awt.Dimension(310, 100));

        headerlogo.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/uniqclearLogo(header).png"))); // NOI18N

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(headerlogo)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(headerlogo)
                .addGap(0, 1, Short.MAX_VALUE))
        );

        jScrollPane2.setBackground(new java.awt.Color(255, 255, 255));
        jScrollPane2.setBorder(null);
        jScrollPane2.setVerticalScrollBarPolicy(javax.swing.ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

        jPanel3.setBackground(new java.awt.Color(255, 255, 255));

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 20)); // NOI18N
        jLabel1.setText("Customer");

        customerTable.setAutoCreateRowSorter(true);
        customerTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Customer ID", "First Name", "Last Name", "Middle Name", "Contact No.", "Customer Type", "Points"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Object.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        customerTable.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jScrollPane1.setViewportView(customerTable);

        jButton1.setBackground(new java.awt.Color(40, 75, 135));
        jButton1.setForeground(new java.awt.Color(255, 255, 255));
        jButton1.setText("Add new customer");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        editCustomer.setBackground(new java.awt.Color(40, 75, 135));
        editCustomer.setForeground(new java.awt.Color(255, 255, 255));
        editCustomer.setText("Edit customer");
        editCustomer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                editCustomerActionPerformed(evt);
            }
        });

        removeCustomer.setBackground(new java.awt.Color(40, 75, 135));
        removeCustomer.setForeground(new java.awt.Color(255, 255, 255));
        removeCustomer.setText("Remove customer");
        removeCustomer.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                removeCustomerActionPerformed(evt);
            }
        });

        homeButton.setBackground(new java.awt.Color(40, 75, 135));
        homeButton.setForeground(new java.awt.Color(255, 255, 255));
        homeButton.setText("Home");
        homeButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                homeButtonActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGap(26, 26, 26)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 878, Short.MAX_VALUE)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jButton1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(editCustomer)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(removeCustomer)))
                        .addGap(6, 6, 6))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 109, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(homeButton))
                        .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(homeButton)
                .addGap(28, 28, 28)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 268, Short.MAX_VALUE)
                .addGap(18, 18, 18)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jButton1)
                    .addComponent(editCustomer)
                    .addComponent(removeCustomer))
                .addGap(56, 56, 56))
        );

        jScrollPane2.setViewportView(jPanel3);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, 920, Short.MAX_VALUE)
            .addComponent(jScrollPane2)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 174, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(jScrollPane2)
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents
   
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
       
        DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
        createCustomerPage newCustomer = new createCustomerPage (this, true);
        newCustomer.setVisible(true);
        newCustomer.addWindowListener(new WindowAdapter(){
            public void windowClosed(WindowEvent e)
            {
              model.setRowCount(0);
              String sql = "SELECT customer_id, first_name, last_name, middle_name, contact_num ,customer_type FROM customer";
                try{
                    //DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
                    PreparedStatement pst = con.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();
                   

                    while(rs.next()){
                        model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6)});
                    }
                }catch(Exception ex){
                    System.out.println("Error: "+ex.getMessage());
                }
            }
          });

    }//GEN-LAST:event_jButton1ActionPerformed

    private void formWindowOpened(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowOpened
        // TODO add your handling code here:
        String sql = "SELECT customer_id, first_name, last_name, middle_name, contact_num, customer_type FROM customer";
        try{
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
            
            while(rs.next()){
                model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5), rs.getString(6)});
            }
        }catch(Exception ex){
            System.out.println("Error: "+ex.getMessage());
        }
    }//GEN-LAST:event_formWindowOpened

    private void removeCustomerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_removeCustomerActionPerformed
        // TODO add your handling code here:
        //customerTable.getSelectedRow();
        DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
        //customerTable.getModel()
        int idColumn = 0;
        int idRow = customerTable.getSelectedRow();
        String selectedID = customerTable.getModel().getValueAt(idRow,idColumn).toString();
        String sql = "DELETE FROM customer WHERE customer_id='"+selectedID + "'";
        try{
            PreparedStatement pst = con.prepareStatement(sql);
            pst.executeUpdate();
        }catch(Exception ex){
            System.out.println("Error: "+ex.getMessage());
        }
        
        if (customerTable.getSelectedRow() != -1) {
            // remove selected row from the model
            model.removeRow(customerTable.getSelectedRow());
        }
    }//GEN-LAST:event_removeCustomerActionPerformed

    private void editCustomerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_editCustomerActionPerformed
        // TODO add your handling code here:
        DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
        int idColumn = 0;
        int idRow = customerTable.getSelectedRow();
        
       
        String selectedID = customerTable.getModel().getValueAt(idRow,idColumn).toString();
        String toeditFirstName = customerTable.getModel().getValueAt(idRow,1).toString();
        String toeditLastName = customerTable.getModel().getValueAt(idRow,2).toString();
        String toeditMiddleName = customerTable.getModel().getValueAt(idRow,3).toString();
        String toeditContact = customerTable.getModel().getValueAt(idRow,4).toString();
        String toeditCType = customerTable.getModel().getValueAt(idRow,5).toString();
        
        
         editCustomerPage editCustomer = new editCustomerPage(this,true);
         editCustomer.selectedID = selectedID;
         editCustomer.editFirstName.setText(toeditFirstName);
         editCustomer.editLastName.setText(toeditLastName);
         editCustomer.editMiddleName.setText(toeditMiddleName);
         editCustomer.editContactNumber.setText(toeditContact);
         editCustomer.editCustomerType.setSelectedItem(toeditCType);
         
          String sql = "SELECT customer_address,birthdate,sex FROM customer WHERE "
                  + "customer_id =" +selectedID+";";
        try{
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            //DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
            
            while(rs.next()){
                String address = rs.getString("customer_address");
                String address2[] = address.split(",");
                String findAddressLine[] = address.split(address2[address2.length-3].trim());
                editCustomer.editBarangay.setSelectedItem(address2[address2.length-3].trim());                
                String adl1 = findAddressLine[0].trim();
                String oldAddress1 = adl1;
                if (oldAddress1.endsWith(",")) {
                    oldAddress1 = oldAddress1.substring(0, oldAddress1.length() - 1);
                }
               
                editCustomer.editLine1Address.setText(oldAddress1);
     
                char sex = rs.getString( "sex").charAt(0);
              
                switch (sex) {
                    case 'M' -> editCustomer.editSM.setSelected(true);
                    case 'F' -> editCustomer.editSF.setSelected(true);
                    default -> editCustomer.editSO.setSelected(true);
                }
                String birthdate = rs.getString("birthdate");
                SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd");
                Date edDate = formatDate.parse(birthdate);
                editCustomer.editBdate.setDate(edDate);
            }
        }catch(Exception ex){
            System.out.println("Error: "+ex.getMessage());
        }

         
         editCustomer.setVisible(true);
         
         
         editCustomer.addWindowListener(new WindowAdapter(){
            public void windowClosed(WindowEvent e)
            {
              //System.out.println("jdialog window closed event received");
              model.setRowCount(0);
              String sql = "SELECT customer_id, first_name, last_name, middle_name, contact_num, customer_type FROM customer";
                try{
                    //DefaultTableModel model = (DefaultTableModel)customerTable.getModel();
                    PreparedStatement pst = con.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();
                   

                    while(rs.next()){
                        model.addRow(new String[]{rs.getString(1),rs.getString(2),rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6)});
                    }
                }catch(Exception ex){
                    System.out.println("Error: "+ex.getMessage());
                }
            }
          });
    }//GEN-LAST:event_editCustomerActionPerformed

    private void homeButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_homeButtonActionPerformed
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_homeButtonActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(customerPage.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(customerPage.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(customerPage.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(customerPage.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new customerPage().setVisible(true);
                
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    public javax.swing.JTable customerTable;
    private javax.swing.JButton editCustomer;
    private javax.swing.JLabel headerlogo;
    private javax.swing.JButton homeButton;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JButton removeCustomer;
    // End of variables declaration//GEN-END:variables
}