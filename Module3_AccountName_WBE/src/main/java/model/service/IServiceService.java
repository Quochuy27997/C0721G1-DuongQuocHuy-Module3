package model.service;

import model.bean.Customer;
import model.bean.Service;

import java.util.List;

public interface IServiceService {
    List<Service> findAll();
//    Customer getServiceById(int id);
    void save(Service service);
}
