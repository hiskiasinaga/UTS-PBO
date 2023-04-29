/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author hiskiasinaga
 */
public class Barang {
    public String id_barang;
    public String nama;
    public float harga;
    
    static ArrayList<Barang> daftarBarang;
    public static void loadBarangFromDB(){
       daftarBarang = new ArrayList<Barang>();
       Barang barang;
        try {
            Statement stmt = DBConnector.connection.createStatement();  
            String sql = "SELECT * FROM barang";
            ResultSet rs = stmt.executeQuery(sql);
            
            while(rs.next()){
                barang = new Barang();
                barang.id_barang = rs.getString("id_barang");  
                barang.nama = rs.getString("nama");
                barang.harga = rs.getFloat("harga"); 
                daftarBarang.add(barang);
            }
            
        } catch (Exception ex) {
            System.out.println(ex);
        }
    
    
}
}
