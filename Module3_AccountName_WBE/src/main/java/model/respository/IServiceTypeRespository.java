package model.respository;

import model.bean.CustomerType;
import model.bean.ServiceType;

import java.util.List;

public interface IServiceTypeRespository {
    List<ServiceType> getList();
}
