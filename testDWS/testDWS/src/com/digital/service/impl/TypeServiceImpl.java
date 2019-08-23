package com.digital.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.digital.dao.TypeDAO;
import com.digital.pojo.Type;
import com.digital.service.TypeService;

@Service("TypeService")
public class TypeServiceImpl implements TypeService{
	@Autowired
	private TypeDAO typeDAO;
	@Override
	public List<Type> getAllType(){
		return typeDAO.getAllType();
	}
	@Override
	public void addType(Type type) {
		typeDAO.addType(type);
	}
	@Override
	public void deleteType(Map map) {
		typeDAO.deleteType(map);
	}
	@Override
	public void editType(Map map) {
		// TODO Auto-generated method stub
		typeDAO.editType(map);
	}
	
}
