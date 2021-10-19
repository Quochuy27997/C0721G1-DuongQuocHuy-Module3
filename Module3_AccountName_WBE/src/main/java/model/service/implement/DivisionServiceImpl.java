package model.service.implement;

import model.bean.Division;
import model.respository.ICustomerTypeRespository;
import model.respository.IDivisionRespository;
import model.respository.Implement.CustomerTypeRespositoryImpl;
import model.respository.Implement.DivisionRespositoryImpl;
import model.service.IDivisionService;

import java.util.List;

public class DivisionServiceImpl implements IDivisionService {
    IDivisionRespository iDivisionRespository = new DivisionRespositoryImpl();
    @Override
    public List<Division> getList() {
        return iDivisionRespository.getList();
    }
}
