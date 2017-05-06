/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opsis.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Kıvanç
 */
public class Sekreter extends Kullanici implements HastaInterface, RandevuInterface {

    @Override
    public short girisyap(Kullanici kullanici) {
        short ret = 0;  
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/OPSIS", "postgres", "root");
            PreparedStatement preparedStatement = null;

            preparedStatement = connection.prepareStatement("SELECT * FROM SEKRETER WHERE kullaniciadi = ? AND sifre = ?");
            
            preparedStatement.setString(1, kullanici.getKullaniciadi());
            preparedStatement.setString(2, kullanici.getSifre());
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                if(kullanici.getKullaniciadi().equals(resultSet.getString("kullaniciadi")) && kullanici.getSifre().equals(resultSet.getString("sifre"))){
                    ret = 1;
                    kullanici.setTckn(resultSet.getLong("tckn"));
                    kullanici.setAd(resultSet.getString("ad"));
                    kullanici.setSoyad(resultSet.getString("soyad"));
                    break;
                }
            }
            System.out.println(kullanici.getKullaniciadi()+" "+kullanici.getSifre());
            preparedStatement.close();
            connection.close();
            
        } catch (SQLException ex) {
            ret = -1; //-1 Veritabanı hatasını temsil eder.
        }
        return ret;
    }

    @Override
    public DefaultTableModel hastalistesigor() {
        
        DefaultTableModel defaultTableModel = null;
        
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/OPSIS", "postgres", "root");
            Statement statement = connection.createStatement();
            
            ResultSet resultSet = statement.executeQuery("SELECT TCKN, AD, SOYAD, CINSIYET, TELEFON, EMAIL, ADRES FROM HASTA");
            ResultSetMetaData metaData = resultSet.getMetaData();
            
            defaultTableModel = new DefaultTableModel();

            defaultTableModel.addColumn("TCKN");
            defaultTableModel.addColumn("AD");
            defaultTableModel.addColumn("SOYAD");
            defaultTableModel.addColumn("CİNSİYET");
            defaultTableModel.addColumn("TELEFON");
            defaultTableModel.addColumn("ADRES");
            defaultTableModel.addColumn("EMAIL");
            
            while (resultSet.next()) {                
                Object [] rowData = new Object[metaData.getColumnCount()];

                for (int i = 0; i < rowData.length; ++i)
                {                  
                    rowData[i] = resultSet.getObject(i+1);
                }
                defaultTableModel.addRow(rowData);
            }
            statement.close();
            connection.close();

        } catch (SQLException ex) {

        } 

        return defaultTableModel;
    }

    @Override
    public boolean hastaekle(Hasta hasta) {
         try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/OPSIS", "postgres", "root");
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO HASTA VALUES (DEFAULT, ?, ?, ?, ?, ?, ?, ?)");
            
            preparedStatement.setLong(1, hasta.getTckn());
            preparedStatement.setString(2, hasta.getAd());
            preparedStatement.setString(3, hasta.getSoyad());
            preparedStatement.setString(4, hasta.getCinsiyet());
            preparedStatement.setLong(5, hasta.getTelefon());
            preparedStatement.setString(6, hasta.getEmail());
            preparedStatement.setString(7, hasta.getAdres());

            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
            
         } catch(SQLException ex){
             return false;
         }
         return true;
    }

    @Override
    public boolean hastaguncelle(Hasta hasta, Long eskiTckn) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/OPSIS", "postgres", "root");
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE HASTA SET TCKN = ?, AD = ?, SOYAD = ?, CINSIYET = ?, TELEFON = ?, EMAIL = ?, ADRES = ? WHERE TCKN = ?");
            
            preparedStatement.setLong(1, hasta.getTckn());
            preparedStatement.setString(2, hasta.getAd());
            preparedStatement.setString(3, hasta.getSoyad());
            preparedStatement.setString(4, hasta.getCinsiyet());
            preparedStatement.setLong(5, hasta.getTelefon());
            preparedStatement.setString(6, hasta.getEmail());
            preparedStatement.setString(7, hasta.getAdres());
            preparedStatement.setLong(8, eskiTckn);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
            
         } catch(SQLException ex){
             return false;
         }
         return true;
    }

    @Override
    public boolean hastasil(Hasta hasta) {
        try {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/OPSIS", "postgres", "root");
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM HASTA WHERE TCKN = ?");
            
            preparedStatement.setLong(1, hasta.getTckn());
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();
            
         } catch(SQLException ex){
             return false;
         }
    return true;
    }  
}
