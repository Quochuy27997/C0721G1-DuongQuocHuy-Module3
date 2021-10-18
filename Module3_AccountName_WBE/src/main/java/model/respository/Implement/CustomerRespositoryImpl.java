package model.respository.Implement;

import model.bean.Customer;
import model.respository.DBConnection;
import model.respository.ICustomerRespository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRespositoryImpl implements ICustomerRespository {
    private static final String SELECT_ALL_CUSTOMERS = "SELECT * FROM customer";
    private static final String INSERT_NEW_CUSTOMER = "INSERT INTO customer ( customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address) VALUES (?,?,?,?,?,?,?,?);";
    private static final String SELECT_CUSTOMER_BY_ID = "SELECT * FROM customer WHERE customer_id = ?";
    private static final String DELETE_CUSTOMER_BY_ID =  "DELETE FROM customer WHERE customer_id = ?; ";
    private static final String SELECT_CUSTOMER = "SELECT*FROM customer " +
            "where customer_id=?;";
    private static final String UPDATE_CUSTOMER = " update customer \n" +
            "  set customer_type_id=?, customer_name = ? , customer_birthday=?,\n" +
            "  customer_gender=?,customer_id_card=?,customer_phone=?,\n" +
            "  customer_email=?,customer_address=?" +
            "  where customer_id = ? ;";


    @Override
    public List<Customer> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMERS);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return customerList;
    }

    @Override
    public void save(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(INSERT_NEW_CUSTOMER);
                preparedStatement.setInt(1, customer.getCustomer_type_id());
                preparedStatement.setString(2, customer.getName());
                preparedStatement.setString(3, customer.getBirthday());
                preparedStatement.setInt(4, customer.getGender());
                preparedStatement.setString(5, customer.getIdCard());
                preparedStatement.setString(6, customer.getPhone());
                preparedStatement.setString(7, customer.getEmail());
                preparedStatement.setString(8, customer.getAddress());

                preparedStatement.executeUpdate();

            } catch (SQLException e) {
                printSQLException(e);
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }

    private void printSQLException(SQLException ex) {

        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    @Override
    public Customer findById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Customer customer = null;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return customer;
    }

    @Override
    public boolean remove(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        boolean rowDeleted;

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_BY_ID);
                preparedStatement.setInt(1, id);
                rowDeleted = preparedStatement.executeUpdate() > 0;
                return rowDeleted;
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return false;
    }

    @Override
    public Customer getCustomerById(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        Customer customer = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int type_id = resultSet.getInt("customer_type_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, type_id);

                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }

        }
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        if (connection != null) {
            try {
                statement = connection.prepareStatement(UPDATE_CUSTOMER);
                statement.setInt(1, customer.getCustomer_type_id());
                statement.setString(2, customer.getName());
                statement.setString(3, customer.getBirthday());
                statement.setInt(4, customer.getGender());
                statement.setString(5, customer.getIdCard());
                statement.setString(6, customer.getPhone());
                statement.setString(7, customer.getEmail());
                statement.setString(8, customer.getAddress());
                statement.setInt(9, customer.getId());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();

            }

        }
    }

    @Override
    public List<Customer> search(int id) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Customer> customerList = new ArrayList<>();

        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id_customer = resultSet.getInt("customer_id");
                    String name = resultSet.getString("customer_name");
                    String birthday = resultSet.getString("customer_birthday");
                    int gender = resultSet.getInt("customer_gender");
                    String idCard = resultSet.getString("customer_id_card");
                    String phone = resultSet.getString("customer_phone");
                    String email = resultSet.getString("customer_email");
                    String address = resultSet.getString("customer_address");
                    int customerTypeId = resultSet.getInt("customer_type_id");
                    Customer customer = new Customer(id_customer, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                    customerList.add(customer);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return customerList;
    }
}
