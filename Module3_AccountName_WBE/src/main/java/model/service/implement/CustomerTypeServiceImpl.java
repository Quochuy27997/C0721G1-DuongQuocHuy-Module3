package model.service.implement;

import model.bean.CustomerType;
import model.respository.ICustomerTypeRespository;
import model.respository.Implement.CustomerTypeRespositoryImpl;
import model.service.ICustomerTypeService;

import java.util.List;

public class CustomerTypeServiceImpl implements ICustomerTypeService {
    ICustomerTypeRespository iCustomerTypeRepository = new CustomerTypeRespositoryImpl();
    @Override
    public List<CustomerType> getList() {
        return iCustomerTypeRepository.getList();
    }
}
