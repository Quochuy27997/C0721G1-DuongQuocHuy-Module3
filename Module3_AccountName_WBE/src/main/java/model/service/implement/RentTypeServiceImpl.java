package model.service.implement;

import model.bean.RentType;
import model.respository.ICustomerTypeRespository;
import model.respository.IRentTypeRespository;
import model.respository.Implement.CustomerTypeRespositoryImpl;
import model.respository.Implement.RentTypeRespositoryImpl;
import model.service.IRentTypeService;

import java.util.List;

public class RentTypeServiceImpl implements IRentTypeService {
    IRentTypeRespository iRentTypeRespository = new RentTypeRespositoryImpl();
    @Override
    public List<RentType> getList() {
        return iRentTypeRespository.getList();
    }
}
