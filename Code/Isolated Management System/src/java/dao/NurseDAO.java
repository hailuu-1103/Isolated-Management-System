/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Nurse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Hashtable;
import java.util.List;

/**
 *
 * @author hoang
 */
public class NurseDAO implements DAO<Nurse> {

    Connection conn = DBcontext.getConnection();

    @Override
    public List<Nurse> parse(String sql) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Nurse get(int account_id) {
        String sql = "SELECT * FROM dbo.nurse\n"
                + "WHERE id_account = " + account_id;
        try {
            Statement sttm = conn.createStatement();
            ResultSet rs = sttm.executeQuery(sql);
            Nurse nurse = new Nurse();
            while (rs.next()) {
                nurse.setId_nurse(rs.getInt("id_nurse"));
                nurse.setName_nurse(rs.getString("name_nurse"));
                nurse.setPhone(rs.getInt("phone"));
                nurse.setFullName(rs.getString("fullname"));
                nurse.setId_account(account_id);
                nurse.setAddress(rs.getString("address"));
                nurse.setId_area(rs.getInt("id_area"));
            }
            return nurse;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Nurse> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void create(Nurse t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void update(Nurse t, Hashtable<String, String> my_dict) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void delete(Nurse t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
