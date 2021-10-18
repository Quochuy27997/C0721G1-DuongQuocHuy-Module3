package model.service.implement;

import model.bean.ServiceType;
import model.respository.ICustomerTypeRespository;
import model.respository.IServiceTypeRespository;
import model.respository.Implement.CustomerTypeRespositoryImpl;
import model.respository.Implement.ServiceTypeRespositoryImpl;
import model.service.IServiceTypeService;

import java.util.List;

public class ServiceTypeServiceImpl implements IServiceTypeService {
    IServiceTypeRespository iServiceTypeRespository = new ServiceTypeRespositoryImpl();
    @Override
    public List<ServiceType> getList() {
        return iServiceTypeRespository.getList();
    }
}
