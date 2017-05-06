/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opsis.controllers;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import opsis.views.GirisEkrani;
import opsis.views.RandevuEkrani;
import opsis.models.Randevu;
import sun.swing.table.DefaultTableCellHeaderRenderer;

/**
 *
 * @author Kıvanç
 */
public class RandevuController {
    
    private RandevuEkrani randevuEkrani;
    private GirisEkrani girisEkrani;
    
    Randevu randevu = new Randevu();
    Locale locale = new Locale("tr", "TR");
    Calendar cal = new GregorianCalendar(locale);
    DefaultTableModel model = new DefaultTableModel();
    
    
    
    
    int realDay = cal.get(GregorianCalendar.DAY_OF_MONTH); //Get day
    int realMonth = cal.get(GregorianCalendar.MONTH); //Get month
    int realYear = cal.get(GregorianCalendar.YEAR); //Get year
    int currentMonth = realMonth; //Match month and year
    int currentYear = realYear;

    public RandevuController(RandevuEkrani randevuEkrani) {
        this.randevuEkrani = randevuEkrani;
        takvimOlustur();
    }
    
    public void takvimOlustur(){
        randevuEkrani.getjButton1().addActionListener((ActionEvent ae) -> {
            if (currentMonth == 0){ //Back one year
		currentMonth = 11;
		currentYear -= 1;
            }
            else{ //Back one month
                currentMonth -= 1;
            }
	updateTakvim(currentMonth, currentYear);
        });
        
        randevuEkrani.getjButton2().addActionListener((ActionEvent ae) -> {
            if (currentMonth == 11){ //Foward one year
                currentMonth = 0;
		currentYear += 1;
            }
            else{ //Foward one month
		currentMonth += 1;
            }
	updateTakvim(currentMonth, currentYear);
        });
         
        randevuEkrani.getjComboBox2().addActionListener((ActionEvent ae)->{
            if(randevuEkrani.getjComboBox2().getSelectedItem()!=null){
                String b =  randevuEkrani.getjComboBox2().getSelectedItem().toString();
		currentYear = Integer.parseInt(b);
		updateTakvim(currentMonth, currentYear);
            }
        });        
        
        String [] columns = {"Pzt", "Sal", "Çar", "Per", "Cum", "Cmt", "Paz"};
        model = new DefaultTableModel(null, columns){
            @Override
            public boolean isCellEditable(int row, int column) {
                return false;
            }
        };
        
        model.setColumnCount(7);
	model.setRowCount(6);
                
        for (int i=realYear; i<=realYear+100; i++){
            randevuEkrani.getjComboBox2().addItem(String.valueOf(i));
	}
               
        updateTakvim(realMonth, realYear);
        
        randevuEkrani.getjTable1().setModel(model);
        randevuEkrani.getjTable1().setCellSelectionEnabled(true);
        randevuEkrani.getjTable1().setSelectionMode(0);
        randevuEkrani.getjTable1().getTableHeader().setReorderingAllowed(false);
        randevuEkrani.getjTable1().getTableHeader().setResizingAllowed(false);

        this.randevuEkrani.getjTable1().setDefaultRenderer(randevuEkrani.getjTable1().getColumnClass(0), new tblCalendarRenderer());
    }
    
    class tblCalendarRenderer extends DefaultTableCellRenderer{
        @Override
	public Component getTableCellRendererComponent (JTable table, Object value, boolean selected, boolean focused, int row, int column){
            super.getTableCellRendererComponent(table, value, selected, focused, row, column);
            if (column == 5 || column == 6){ //Week-end
		setBackground(new Color(209,209,209));
                setForeground(Color.black);
                setEnabled(false);

            }
            else{ //Week
		setBackground(new Color(255, 255, 255));
                setForeground(Color.black);
                setEnabled(true);
            }
            if (value != null){
		if (Integer.parseInt(value.toString()) == realDay && currentMonth == realMonth && currentYear == realYear){ //Today
                    setBackground(new Color(142,226,127));
                    setForeground(Color.black);
                }
            }
            
            if(value == null){
                setEnabled(false);
            }

            if(selected){
                setBackground(new Color(0,120,215));
                setForeground(Color.white);
            }

            setFont(new Font("Segoe UI", Font.PLAIN, 14));
            
            return this;  
	}
    }
    
    public void updateTakvim(int month, int year) {
        String[] months =  {"Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"};
	int nod, som; //Number Of Days, Start Of Month
        
        randevuEkrani.getjButton1().setEnabled(true);
	randevuEkrani.getjButton2().setEnabled(true);
	if (month == 0 && year <= realYear-10){randevuEkrani.getjButton1().setEnabled(false);} //Too early
	if (month == 11 && year >= realYear+100){randevuEkrani.getjButton2().setEnabled(false);} //Too late
	randevuEkrani.getjLabel1().setText(months[month]); //Refresh the month label (at the top)
	randevuEkrani.getjComboBox2().setSelectedItem(String.valueOf(year)); //Select the correct year in the combo box
        
        for (int i=0; i<6; i++){
            for (int j=0; j<7; j++){
		model.setValueAt(null, i, j);
            }
        }
        cal.set(year, month, 1);
	nod = cal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH);
	som = cal.get(GregorianCalendar.DAY_OF_WEEK);
	som=som-1;
        if(som==0){som=7;}
	//Draw calendar
	for (int i=1; i<=nod; i++){
            int row = new Integer((i+som-2)/7);
            int column  =  ((i+som-2)%7);
            model.setValueAt(i, row, column);
	}
        randevuEkrani.getjTable1().setSelectionMode(0);
        randevuEkrani.getjTable1().setModel(model);
    }
    
}
