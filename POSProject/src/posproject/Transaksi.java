/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author hiskiasinaga
 */
public class Transaksi {
    public static int id_transaksi;
    public static int id_pelanggan;
    public static float total_harga;
    public static String date;
    public static ArrayList<itemTransaksi> listItem = new ArrayList<>();
    
    public Transaksi(int id_transaksi, int id_pelanggan, float total_harga, String date){
      this.id_transaksi = id_transaksi;
      this.id_pelanggan = id_pelanggan;
      this.total_harga = total_harga;
      this.date = date;
    
    }
    
    public static void addItem(itemTransaksi item){
        listItem.add(item);
    }
    
    public static void simpanDatabase() throws SQLException{
        
        try{
            Connection conn = DBConnector.initDBConnection();
            String sql = "INSERT INTO transaksi(id_transaksi, id_pelanggan, total_harga, date) VALUES(?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id_transaksi);
            stmt.setInt(2,id_pelanggan);
            stmt.setFloat(3, total_harga);
            stmt.setString(4,date);
            stmt.executeUpdate();
            
            
            sql = "INSERT INTO itemTransaksi (id_transaksi, id_barang, nama_barang, harga_satuan, jumlah_barang, harga_total) VALUES(?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            for(itemTransaksi item : listItem){
                stmt.setInt(1, id_transaksi);
                stmt.setString(2,item.id_barang);
                stmt.setString(3, item.nama_barang);
                stmt.setFloat(4,item.harga_satuan);
                stmt.setInt(5, item.jumlah_barang);
                stmt.setFloat(6, item.harga_total);
                stmt.executeUpdate();
            }
             
            
        } catch(SQLException e){
            System.out.print(e);
        }
    }


     static class itemTransaksi {
        public String id_barang;
        public String nama_barang;
        public float harga_satuan;
        public int jumlah_barang;
        public float harga_total;
        
        
        public itemTransaksi(String id_barang, String nama_barang, float harga_satuan, int jumlah_barang, float harga_total) {
            this.id_barang = id_barang;
            this.nama_barang = nama_barang;
            this.harga_satuan = harga_satuan;
            this.jumlah_barang = jumlah_barang;
            this.harga_total = harga_total;
          
        }
    }

}


    