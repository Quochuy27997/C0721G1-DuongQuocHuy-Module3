package model.service.implement;

import model.bean.Customer;
import model.bean.Service;
import model.respository.ICustomerRespository;
import model.respository.IServiceRespository;
import model.respository.Implement.CustomerRespositoryImpl;
import model.respository.Implement.ServiceRespositoryImpl;
import model.service.IServiceService;

import java.util.List;

public class ServiceServiceImpl implements IServiceService {
    private IServiceRespository iServiceRespository =  new ServiceRespositoryImpl();
    @Override
    public List<Service> findAll() {
        return iServiceRespository.findAll();
    }

//    @Override
//    public Customer getServiceById(int id) {
//        return iServiceRespository.getServiceById(id);
//    }

    @Override
    public void save(Service service) {

    }
}
