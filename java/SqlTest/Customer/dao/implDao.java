package SqlTest.Customer.dao;

import SqlTest.Customer.model.Customer;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class implDao implements CustomerDAO {
    private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void insert(Customer customer) {
        String sql = "INSERT INTO CUSTOMER (cust_id, name, age) VALUES (?, ? ,?)";
        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, customer.getCustId());
            preparedStatement.setString(2, customer.getName());
            preparedStatement.setInt(3, customer.getAge());
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {}
            }
        }
    }
    public Customer findByCustomerId(int custId){
        String sql = "SELECT * FROM CUSTOMER WHERE cust_id = ?";
        Connection connection = null;
        try {
            connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, custId);
            Customer customer = null;
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                customer = new Customer(
                        resultSet.getInt("CUST_ID"),
                        resultSet.getString("NAME"),
                        resultSet.getInt("Age")
                );
            }
            resultSet.close();
            preparedStatement.close();
        } catch (Exception e) {

        }
        return new Customer();
    }

}
