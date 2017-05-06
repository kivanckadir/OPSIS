/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package opsis.models;

import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Kıvanç
 */
public interface HastaInterface {
    
    /**
     *
     * @return
     */
    public DefaultTableModel hastalistesigor();
    public boolean hastaekle(Hasta hasta);
    public boolean hastaguncelle(Hasta hasta, Long eskiTckn);
    public boolean hastasil(Hasta hasta);
}
