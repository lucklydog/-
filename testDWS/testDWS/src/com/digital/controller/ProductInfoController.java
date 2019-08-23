package com.digital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.digital.pojo.ProductInfo;
import com.digital.service.ProductInfoService;
@Controller
@RequestMapping("/productinfo")
public class ProductInfoController {

		@Autowired
		private ProductInfoService productInfoService;
		@RequestMapping("/productInfoList")
		@ResponseBody
		public List<ProductInfo> ProductInfolist() {
			List<ProductInfo> pList = productInfoService.getAllProductInfo();
			return pList;
		}
}
