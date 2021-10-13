package com.codegym.model.service;

import com.codegym.model.repository.IUserDAO;
import com.codegym.model.repository.UserDAO;
import com.codegym.model.bean.User;
import javafx.scene.control.TableView;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements IUserService {
    IUserDAO userDao = new UserDAO();

    @Override
    public void insertUser(User user) throws SQLException {
        userDao.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDao.selectUser(id);

    }

    @Override
    public List<User> selectAllUsers() {
        return userDao.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return userDao.deleteUser(id);

    }

    @Override
    public boolean updateUser(User user) throws SQLException {

        return userDao.updateUser(user);
    }

    @Override
    public List<User> find(String country) throws SQLException {
        return userDao.find(country);
    }

    @Override
    public List<User> sort() throws SQLException {
        return userDao.sort();
    }

    @Override
    public void addUserTransaction(User user, int[] permision) throws SQLException {
        userDao.addUserTransaction(user, permision);
    }

    @Override
    public void insertUpdateWithoutTransaction() throws SQLException {
        userDao.insertUpdateWithoutTransaction();
    }

    @Override
    public User getUserById(int id) {
        return userDao.getUserById(id);
    }

    @Override
    public void insertUserStore(User newUser) throws SQLException {
        userDao.insertUserStore(newUser);
    }

    @Override
    public void insertUpdateUseTransaction() {
        userDao.insertUpdateUseTransaction();
    }
}
