package com.digital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.digital.pojo.AdminInfo;
import com.digital.pojo.Type;
import com.digital.pojo.UserInfo;
import com.digital.service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController {
	@Autowired
	private TypeService typeService;
	@RequestMapping("/typelist")
	@ResponseBody
	public List<Type> typelist() {
		List<Type> tList = typeService.getAllType();
		return tList;
	}
	@RequestMapping(value = "/addType", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addType(Type ai) {
		try {
			typeService.addType(ai);
			return "{\"success\":\"true\",\"message\":\"��ӳɹ�\"}";
		} catch (Exception e) {
			return "{\"success\":\"false\",\"message\":\"���ʧ��\"}";
		}
	}
	//ɾ��
	@RequestMapping("/deleteType")
	@ResponseBody
	public String deleteType(@RequestParam(value = "uids") String uids){
		String str = "";
		String[] tids=uids.substring(0, uids.length() - 1).split(",");
		List<Integer> ids= new ArrayList<Integer>();
		for (String id : tids) {
			ids.add(Integer.parseInt(id));
		}
		// ����Map���Ͷ���params,��SQLӳ���ļ�userInfoMapper.xml�е�updateUserStatus�������ݲ���
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ids", ids);
		try {			
			typeService.deleteType(params);
			str = "{\"success\":\"true\",\"message\":\"ɾ���ɹ���\"}";
		} catch (Exception e) {
			e.printStackTrace();
			str = "{\"success\":\"false\",\"message\":\"ɾ��ʧ�ܣ�\"}";
		}
		return str;	
	}
	/*
	//�޸�֧��
	@RequestMapping("/editType/{id}")
	@ResponseBody
	public String editType(@PathVariable("id") String ids){
		String str = "";
		int id = Integer.parseInt(ids)
		try {			
			typeService.editType(id);
			str = "{\"success\":\"true\",\"message\":\"ɾ���ɹ���\"}";
		} catch (Exception e) {
			e.printStackTrace();
			str = "{\"success\":\"false\",\"message\":\"ɾ��ʧ�ܣ�\"}";
		}
		return str;	
	}
	*/
}
