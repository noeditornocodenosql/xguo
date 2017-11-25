package com.xg.mapper;

import java.util.List;

import com.xg.model.Admin;
import com.xg.model.Page;

public interface AdminMapper {
	public Admin checkLogin(Admin admin);
	public List<Admin>findAllAdmins();
	public long getAllAdminCount();
	public List<Admin> getAdmins(Page page);
	public void saveAdmin(Admin admin);
	public Admin findAdminByAid(int aId);
	public void updateAdminByAid(Admin admin);
	public void deleteAdminByAid(int aId);
	public Admin findByACode(String aCode);
	public Admin findByUsername(String aUserName);
}
