package com.digital.dao;

import java.util.List;
import java.util.Map;

import com.digital.pojo.Type;


public interface TypeDAO {
	public List<Type> getAllType();
	public void addType(Type type);
	public void deleteType(Map map);
	public void editType(Map map);
}
