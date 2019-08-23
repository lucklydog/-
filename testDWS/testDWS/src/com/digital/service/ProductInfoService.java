package com.digital.service;

import java.util.List;

import com.digital.pojo.ProductInfo;

public interface ProductInfoService {
	public List<ProductInfo> getAllProductInfo();
	public void addProductInfo (ProductInfo pi);
}
