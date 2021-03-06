package com.codegym.model.repository;

import com.codegym.model.bean.User;
import com.mysql.cj.protocol.Resultset;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {

    public UserDAO() {
    }

    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, country) VALUES (?, ?, ?);";
    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";
    private static final String SELECT_USERS_BY_COUNTRY = "select * from users where country=?;";
    private static final String SELECT_USER_SORT_NAME_ASC = "select id,name,email,country from users order by name ASC";

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = DBConnection.getConnection();
        if (connection != null) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getCountry());
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                printSQLException(e);
            } finally {
                DBConnection.close();
            }
        }
    }


    @Override
    public User selectUser(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnection.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            DBConnection.close();
        }
        return user;

    }

    @Override
    public List<User> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> users = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConnection.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                users.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            printSQLException(e);
        } finally {
            DBConnection.close();
        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } finally {
            DBConnection.close();
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getCountry());
            statement.setInt(4, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } finally {
            DBConnection.close();
        }
        return rowUpdated;
    }

    @Override
    public List<User> find(String country) throws SQLException {
//        SELECT_USERS_BY_COUNTRY
        Connection connection = DBConnection.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<User> userList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_USERS_BY_COUNTRY);
                statement.setString(1, country);
                resultSet = statement.executeQuery();
                User user = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String countries = resultSet.getString("country");
                    user = new User(id, name, email, countries);
                    userList.add(user);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                resultSet.close();
                statement.close();
                DBConnection.close();
            }
        }

        return userList;
    }

    @Override
    public List<User> sort() throws SQLException {

        Connection connection = DBConnection.getConnection();
        ResultSet resultSet = null;
        PreparedStatement statement = null;
        List<User> userList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_USER_SORT_NAME_ASC);
//                statement.setString(1, name);
                resultSet = statement.executeQuery();
                User user = null;
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    String email = resultSet.getString("email");
                    String countries = resultSet.getString("country");
                    user = new User(id, name, email, countries);
                    userList.add(user);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                resultSet.close();
                statement.close();
                DBConnection.close();
            }
        }

        return userList;
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
}

