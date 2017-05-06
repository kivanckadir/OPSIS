/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opsis.controllers;

import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import opsis.views.DoktorEkrani;
import opsis.views.GirisEkrani;
import opsis.views.RandevuEkrani;
import opsis.views.SekreterEkrani;
import opsis.views.SifremiUnuttumEkrani;
import opsis.views.YoneticiEkrani;
import opsis.models.Doktor;
import opsis.models.Sekreter;
import opsis.models.Yonetici;

/**
 *
 * @author Kıvanç
 */
public class GirisController {
    private GirisEkrani girisEkrani;
    
    public GirisController(GirisEkrani girisEkrani){
        this.girisEkrani = girisEkrani;
        
        this.girisEkrani.getGiris_BTN().addActionListener( (ActionEvent ae)->{
            //RandevuEkrani re = new RandevuEkrani();
            //re.show();
            String girisTipi = this.girisEkrani.getGiristipi_CMB().getSelectedItem().toString();
            String kim;
            
            if(girisTipi.equals("Sekreter")){
                Sekreter sekreter = new Sekreter();
                sekreter.setKullaniciadi(girisEkrani.getKullaniciadi_TXT().getText());
                sekreter.setSifre(girisEkrani.getSifre_TXT().getText());
                short giris = sekreter.girisyap(sekreter);
                if(giris==1){
                    kim = sekreter.getAd()+" "+sekreter.getSoyad();
                    girisEkrani.dispose();
                    SekreterEkrani sekreterEkrani = new SekreterEkrani();
                    sekreterEkrani.setVisible(true);
                    sekreterEkrani.setTitle("Hoşgeldiniz: " + kim);
                }
                
                else if (giris == 0){
                    girisEkrani.getHata_LBL().setText("Kullanıcı Adı ya da Şifre Hatalı!");
                }
                
                else{
                    girisEkrani.getHata_LBL().setText("Veritabanı Hatası!");
                }
            }
            
            else if(girisTipi.equals("Doktor")){
                Doktor doktor = new Doktor();
                doktor.setKullaniciadi(girisEkrani.getKullaniciadi_TXT().getText());
                doktor.setSifre(girisEkrani.getSifre_TXT().getText());
                short giris = doktor.girisyap(doktor);
                if(giris==1){
                    kim = doktor.getAd()+" "+doktor.getSoyad();
                    girisEkrani.dispose();
                    DoktorEkrani doktorEkrani = new DoktorEkrani();
                    doktorEkrani.setVisible(true);
                    doktorEkrani.setTitle("Hoşgeldiniz: " + kim);
                }
                
                else if (giris == 0){
                    girisEkrani.getHata_LBL().setText("Kullanıcı Adı ya da Şifre Hatalı!");
                }
                
                else{
                    girisEkrani.getHata_LBL().setText("Veritabanı Hatası!");
                }
            }
            
            else{
                Yonetici yonetici = new Yonetici();
                yonetici.setKullaniciadi(girisEkrani.getKullaniciadi_TXT().getText());
                yonetici.setSifre(girisEkrani.getSifre_TXT().getText());
                short giris = yonetici.girisyap(yonetici);
                if(giris==1){
                    kim = yonetici.getAd()+" "+yonetici.getSoyad();
                    girisEkrani.dispose();
                    YoneticiEkrani yoneticiEkrani = new YoneticiEkrani();
                    yoneticiEkrani.setVisible(true);
                    yoneticiEkrani.setTitle("Hoşgeldiniz: " + kim);
                }
                
                else if (giris == 0){
                    girisEkrani.getHata_LBL().setText("Kullanıcı Adı ya da Şifre Hatalı!");
                }
                
                else{
                    girisEkrani.getHata_LBL().setText("Veritabanı Hatası!");
                }
            }            
        });
    }
}
