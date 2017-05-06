package opsis.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import opsis.views.GirisEkrani;

public abstract class Kullanici extends Kisi {
    private String kullaniciadi;
    private String sifre;

    public void setKullaniciadi(String kullaniciadi) {
        this.kullaniciadi = kullaniciadi;
    }

    public void setSifre(String sifre) {
        this.sifre = sifre;
    }

    public String getKullaniciadi() {
        return kullaniciadi;
    }

    public String getSifre() {
        return sifre;
    }
    
    public abstract short girisyap(Kullanici kullanici);
    
    public void cikisyap(){}
    public void sifreyenile(){}
}
