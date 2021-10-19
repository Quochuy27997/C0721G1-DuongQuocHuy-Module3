package model.service.implement;

import model.bean.EducationDegree;
import model.respository.IDivisionRespository;
import model.respository.IEducationDegreeRespository;
import model.respository.Implement.DivisionRespositoryImpl;
import model.respository.Implement.EducationDegreeRespositoryImpl;
import model.service.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {
    IEducationDegreeRespository iEducationDegreeRespository = new EducationDegreeRespositoryImpl();
    @Override
    public List<EducationDegree> getList() {
        return iEducationDegreeRespository.getList();
    }
}
