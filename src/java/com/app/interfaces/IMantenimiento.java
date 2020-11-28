package com.app.interfaces;
import java.util.List;

public interface IMantenimiento {
    public List<?>getAll();
    public Object getFindId(int id);
    public int add(Object u);
    public int update(Object u);
    public void delete(int id);
        
}
