/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opsis.controllers;

import java.awt.event.ActionEvent;
import opsis.views.Bildirim;
import opsis.views.EminMisiniz;
import opsis.views.HastaKayitEkrani;
import opsis.views.SekreterEkrani;
import opsis.models.Hasta;
import opsis.models.Sekreter;
import opsis.views.HastaGuncellemeEkrani;

/**
 *
 * @author Kıvanç
 */
public class SekreterController {
    Hasta hasta = new Hasta();
    Sekreter sekreter = new Sekreter();
    Bildirim bildirim = new Bildirim();
    
    private EminMisiniz eminMisiniz;
    private SekreterEkrani sekreterEkrani;
    private HastaKayitEkrani hastaKayitEkrani;
    private HastaGuncellemeEkrani hastaGuncellemeEkrani;
    
    static Long eskiTckn;

    //Ekleme
    public SekreterController(HastaKayitEkrani hastaKayitEkrani) {
        this.hastaKayitEkrani = hastaKayitEkrani;
        this.hastaKayitEkrani.getjButton1().addActionListener( (ActionEvent ae)->{
            hasta.setTckn       (Long.parseLong(hastaKayitEkrani.getjTextField1()));
            hasta.setAd         (hastaKayitEkrani.getjTextField2());
            hasta.setSoyad      (hastaKayitEkrani.getjTextField3());
            hasta.setCinsiyet   (hastaKayitEkrani.getSecilenCinsiyet());
            hasta.setTelefon    (Long.parseLong(hastaKayitEkrani.getjTextField4()));
            hasta.setAdres      (hastaKayitEkrani.getjTextArea1());
            hasta.setEmail      (hastaKayitEkrani.getjTextField7());
            
            sekreterHastaEkle();
        });
        
        this.hastaKayitEkrani.getjButton2().addActionListener( (ActionEvent ae)->{
            hastaKayitEkrani.dispose();
        });
    }
    //Güncelleme
    public SekreterController(HastaGuncellemeEkrani hastaGuncellemeEkrani) {
        this.hastaGuncellemeEkrani = hastaGuncellemeEkrani;
        this.hastaGuncellemeEkrani.getjButton1().addActionListener( (ActionEvent ae)->{
            
            hasta.setTckn       (Long.parseLong(hastaGuncellemeEkrani.getjTextField1().getText()));
            hasta.setAd         (hastaGuncellemeEkrani.getjTextField2().getText());
            hasta.setSoyad      (hastaGuncellemeEkrani.getjTextField3().getText());
            hasta.setCinsiyet   (hastaGuncellemeEkrani.getSecilenCinsiyet());
            hasta.setTelefon    (Long.parseLong(hastaGuncellemeEkrani.getjTextField4().getText()));
            hasta.setAdres      (hastaGuncellemeEkrani.getjTextArea1().getText());
            hasta.setEmail      (hastaGuncellemeEkrani.getjTextField7().getText());

            sekreterHastaGuncelle();
            hastaGuncellemeEkrani.dispose();
        });
        
        
        this.hastaGuncellemeEkrani.getjButton2().addActionListener( (ActionEvent ae)->{
            hastaGuncellemeEkrani.dispose();
        });
    }
    //Silme
    public SekreterController(EminMisiniz eminMisiniz) {
        this.eminMisiniz = eminMisiniz;
        
        this.eminMisiniz.getjButton1().addActionListener( (ActionEvent ae)->{
            hasta.setTckn(Long.parseLong(eminMisiniz.getjList1().getModel().getElementAt(0)));
            sekreterHastaSil();
            eminMisiniz.dispose();
            
        });
        
        this.eminMisiniz.getjButton2().addActionListener( (ActionEvent ae)->{
            eminMisiniz.dispose();
        });
    }
    
    public SekreterController(SekreterEkrani sekreterEkrani) {
        this.sekreterEkrani = sekreterEkrani;
        
        //Sil Butonu Listener
        this.sekreterEkrani.getjButton3().addActionListener( (ActionEvent ae)->{
            
            hasta.setTckn(sekreterEkrani.getSeciliTckn());
            
            EminMisiniz eminMisiniz = new EminMisiniz();
            eminMisiniz.getjLabel1().setText("Aşağıdaki Kayıt Silinecek Emin Misiniz?");
            String tckn, ad, soyad, cinsiyet, telefon, adres, email;
            
            tckn    =   Long.toString(sekreterEkrani.getSeciliTckn());
            ad      =   sekreterEkrani.getSeciliAd();
            soyad   =   sekreterEkrani.getSeciliSoyad();
            cinsiyet=   sekreterEkrani.getSeciliCinsiyet();
            telefon =   Long.toString(sekreterEkrani.getSeciliTelefon());
            adres   =   sekreterEkrani.getSeciliAdres();
            email   =   sekreterEkrani.getSeciliEmail();
            String[] dizi = {tckn, ad, soyad, cinsiyet, telefon, adres, email};

            eminMisiniz.getjList1().setListData(dizi);
            eminMisiniz.show();
         });
        
        //Ekle Butonu Listener
        this.sekreterEkrani.getjButton1().addActionListener( (ActionEvent ae)->{
            HastaKayitEkrani hastaKayitEkrani = new HastaKayitEkrani();
            hastaKayitEkrani.show();
         });
        
        //Düzenle Butonu Listener
        this.sekreterEkrani.getjButton2().addActionListener((ActionEvent ae) -> {
            HastaGuncellemeEkrani hastaGuncellemeEkrani = new HastaGuncellemeEkrani();
            hastaGuncellemeEkrani.setTitle("Hasta Güncelle");

            String tckn, ad, soyad, cinsiyet, telefon, adres, email;

            tckn = Long.toString(sekreterEkrani.getSeciliTckn());
            ad = sekreterEkrani.getSeciliAd();
            soyad = sekreterEkrani.getSeciliSoyad();
            cinsiyet = sekreterEkrani.getSeciliCinsiyet();
            telefon = Long.toString(sekreterEkrani.getSeciliTelefon());
            adres = sekreterEkrani.getSeciliAdres();
            email = sekreterEkrani.getSeciliEmail();

            hastaGuncellemeEkrani.getjTextField1().setText(tckn);
            hastaGuncellemeEkrani.getjTextField2().setText(ad);
            hastaGuncellemeEkrani.getjTextField3().setText(soyad);

            if (cinsiyet.equals("Erkek")) {
                hastaGuncellemeEkrani.getjRadioButton1().setSelected(true);
            } else if (cinsiyet.equals("Kadın")) {
                hastaGuncellemeEkrani.getjRadioButton2().setSelected(true);
            }

            hastaGuncellemeEkrani.getjTextField4().setText(telefon);
            hastaGuncellemeEkrani.getjTextArea1().setText(adres);
            hastaGuncellemeEkrani.getjTextField7().setText(email);

            eskiTckn = sekreterEkrani.getSeciliTckn();

            hastaGuncellemeEkrani.show();

        });        
    }

    public void sekreterHastaEkle(){
        if(sekreter.hastaekle(hasta)){
            bildirim.getjLabel1().setText("Kayıt Başarıyla Eklendi");
            bildirim.show(true);
            hastaKayitEkrani.dispose();
        }
        else{
            bildirim.getjLabel1().setText("Kayıt Eklenemedi!");
            bildirim.show(true);
        }
    }
    
    public void sekreterHastaSil(){
        if(sekreter.hastasil(hasta)){
            bildirim.getjLabel1().setText("Kayıt Başarıyla Silindi");
            bildirim.show(true);
        }
        else{
            bildirim.getjLabel1().setText("Kayıt Silinemedi!");
            bildirim.show(true);
        }
    }
    
    public void sekreterHastaGuncelle(){
        System.out.println(eskiTckn);
        if(sekreter.hastaguncelle(hasta, eskiTckn)){
            bildirim.getjLabel1().setText("Kayıt Başarıyla Güncellendi");
            bildirim.show(true);
        }
        else{
            bildirim.getjLabel1().setText("Kayıt Güncellenemedi!");
            bildirim.show(true);
        }
    }
    
    public void hastaListesiUpdate(){
        sekreterEkrani.getHastaListesi().setModel(sekreter.hastalistesigor());
    }
}
