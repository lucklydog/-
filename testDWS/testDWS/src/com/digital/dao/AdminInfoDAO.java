package com.digital.dao;

import java.util.List;
import java.util.Map;

import com.digital.pojo.AdminInfo;

public interface AdminInfoDAO {
	public AdminInfo getAdminInfoByCond(AdminInfo ai);
	public AdminInfo getAdminInfoFunctions(int id);
	public List<AdminInfo> getAllAdminInfo();
	public void addAdminInfo(AdminInfo ai);
	public void deleteAdminInfo(Map map);
}
