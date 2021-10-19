package model.service.implement;

import model.bean.Position;
import model.respository.IPositionRespository;
import model.respository.Implement.PositionRespositoryImpl;
import model.service.IPositionService;

import java.util.List;

public class PositionServiceImpl implements IPositionService {
    IPositionRespository iPositionRespository=new PositionRespositoryImpl();
 @Override
    public List<Position> getList() {
        return iPositionRespository.getList();
    }
}
