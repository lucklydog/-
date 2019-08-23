package com.digital.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.digital.dao.ProductInfoDAO;
import com.digital.pojo.ProductInfo;
import com.digital.service.ProductInfoService;

@Service("productInfoService")
public class ProductInfoServiceImpl implements ProductInfoService{
	@Autowired
	private ProductInfoDAO productInfoDAO;
	
	@Override
	public List<ProductInfo> getAllProductInfo(){
		return productInfoDAO.getAllProductInfo();
	}
	@Override
	public void addProductInfo (ProductInfo pi) {
	 productInfoDAO.addProductInfo(pi);
	}
}
