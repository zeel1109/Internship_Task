package dao;

import java.sql.*;
import java.util.*;

public class LeaveDAO {

    public static List<Leave> getAllLeaves() {

        List<Leave> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(
                "SELECT l.*, u.name FROM leaves l JOIN users u ON l.user_id = u.id"
            );

            while (rs.next()) {
                list.add(new Leave(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("from_date"),
                        rs.getString("to_date"),
                        rs.getString("reason"),
                        rs.getString("status")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    public static ResultSet getLeavesByUser(int userId) {
        ResultSet rs = null;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM leaves WHERE user_id=? ORDER BY id DESC"
            );
            ps.setInt(1, userId);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

}
