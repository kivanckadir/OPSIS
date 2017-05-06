package opsis.views;

import com.sun.org.apache.xpath.internal.operations.Equals;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import javax.swing.SingleSelectionModel;
import javax.swing.table.*;
 
public class Takvim extends JFrame {
 
  DefaultTableModel model;
  Calendar cal = new GregorianCalendar();
  JLabel label;
  JTable takvimTable;
  String month;
  int year;
 
  Takvim() {
 
    this.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    this.setTitle("Takvim");
    this.setSize(300,200);
    this.setLayout(new BorderLayout());
    this.setVisible(true);
 
 
    label = new JLabel();
    label.setHorizontalAlignment(SwingConstants.CENTER);
 
    JButton b1 = new JButton("<");
    b1.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent ae) {
        cal.add(Calendar.MONTH, -1);
        updateMonth();
      }
    });
 
    JButton b2 = new JButton(">");
    b2.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent ae) {
        cal.add(Calendar.MONTH, +1);
        updateMonth();
      }
    });
 
    JPanel panel = new JPanel();
    panel.setLayout(new BorderLayout());
    panel.add(b1,BorderLayout.WEST);
    panel.add(label,BorderLayout.CENTER);
    panel.add(b2,BorderLayout.EAST);
 
 
    String [] columns = {"Pzt", "Sal", "Çar", "Per", "Cum", "Cmt", "Paz"};
    model = new DefaultTableModel(null, columns){
        @Override
        public boolean isCellEditable(int row, int column) {
            return false;
        }
    };
    takvimTable = new JTable(model);
    takvimTable.setCellSelectionEnabled(true);
    takvimTable.setSelectionMode(0);
    takvimTable.getTableHeader().setReorderingAllowed(false);
    takvimTable.getTableHeader().setResizingAllowed(false);
    
    JScrollPane pane = new JScrollPane(takvimTable);
 
    this.add(panel,BorderLayout.NORTH);
    this.add(pane,BorderLayout.CENTER);
 
    this.updateMonth();
 
  }
 
  void updateMonth() {
    cal.set(Calendar.DAY_OF_MONTH, 1);
 
    month = cal.getDisplayName(Calendar.MONTH, Calendar.LONG, new Locale("tr", "TR"));
    year = cal.get(Calendar.YEAR);
    label.setText(month + " " + year);
 
    int startDay = cal.get(Calendar.DAY_OF_WEEK);
    int numberOfDays = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int weeks = cal.getActualMaximum(Calendar.WEEK_OF_MONTH);
 
    model.setRowCount(0);
    model.setRowCount(weeks);
 
    int i = startDay-1;
    for(int day=1;day<=numberOfDays;day++){
      model.setValueAt(day, i/7 , i%7 );    
      i = i + 1;
    }
 
  }
  
  public String getSecilenTarih(){
      return takvimTable.getValueAt(takvimTable.getSelectedRow(), takvimTable.getSelectedColumn()).toString()+"/"+getAyIndex(month)+"/"+Integer.toString(year);
  }
  
    public String getAyIndex(String month){
        String ret=null;
        if(month.equals("Ocak")){ret="01";}
        if(month.equals("Şubat")){ret="02";}
        if(month.equals("Mart")){ret="03";}
        if(month.equals("Nisan")){ret="04";}
        if(month.equals("Mayıs")){ret="05";}
        if(month.equals("Haziran")){ret="06";}
        if(month.equals("Temmuz")){ret="07";}
        if(month.equals("Ağustos")){ret="08";}
        if(month.equals("Eylül")){ret="09";}
        if(month.equals("Ekim")){ret="10";}
        if(month.equals("Kasım")){ret="11";}
        if(month.equals("Aralık")){ret="12";}
        return ret;
    }
  public static void main(String[] arguments) {
    JFrame.setDefaultLookAndFeelDecorated(true);
    Takvim sc = new Takvim();
  }
 
}