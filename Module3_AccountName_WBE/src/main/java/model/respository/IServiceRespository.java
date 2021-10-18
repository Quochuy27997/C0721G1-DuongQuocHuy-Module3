package model.respository;

import model.bean.Customer;
import model.bean.Service;

import java.util.List;

public interface IServiceRespository {

    List<Service> findAll();
//    Customer getServiceById(int id);
    void save(Service service);
}
