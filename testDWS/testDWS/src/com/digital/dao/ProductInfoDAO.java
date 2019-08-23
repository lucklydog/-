package com.digital.dao;

import java.util.List;

import com.digital.pojo.ProductInfo;

public interface ProductInfoDAO {
	
	public List<ProductInfo> getAllProductInfo();
	public void addProductInfo (ProductInfo pi);

}
