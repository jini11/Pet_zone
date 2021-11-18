package WebContent.JSP.jdbc;

import java.sql.*;
public class SelectFromCustomer {
    public static void main(String args[]) {
        Connection con = null;
        Statement stmt = null;
        String url = "jdbc:mysql://localhost/db_dog";
        String user = "root";
        String passwd = "6497";

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (java.lang.ClassNotFoundException e){
            System.err.print("ClassNotFoundException");
            System.err.println("드라이버 로딩 오류: "+e.getMessage());
            return;
        }

        try {
            con = DriverManager.getConnection(url,user,passwd);
            stmt = con.createStatement();
            ResultSet result = stmt.executeQuery("SELECT * FROM pet_zone");

            int count = 0;
            while(result.next()) {
                if(count == 0)
                    displayHeadInfo();
                String resultStr = result.getString("id") + "\t";
                resultStr += result.getString("name") + "\t";
                resultStr += result.getString("typeid") + "\t\t\t";
                resultStr += result.getString("address") + "\t";
                resultStr += result.getString("phone") + "\t";
                resultStr += result.getString("wd_time") + "\t";
                resultStr += result.getString("we_time") + "\t";
                resultStr += result.getString("c_time");
                System.out.println(resultStr);
                count++;
            }
            displayEndInfo(count);
            stmt.close();
            con.close();
        } catch (SQLException ex) {
            System.err.println("Select 오류: "+ex.getMessage());
        }
    }

    public static void displayHeadInfo() {
        System.out.println("\n펫존 테이블 결과");
        drawLine();
        System.out.println("id\t\t가게명\t\t\t종류\t\t\t\t\t주소\t\t\t\t\t전화번호\t\t\t평일\t\t\t주말\t\t\t휴무");
        drawLine();
    }

    public static void displayEndInfo(int count) {
        drawLine();
        System.out.println(count + "개의 레코드가 검색되었습니다! ");
    }

    public static void drawLine() {
        System.out.println("==================================================================================================================");
    }
}
