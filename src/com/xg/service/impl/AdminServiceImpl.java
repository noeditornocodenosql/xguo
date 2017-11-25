package com.xg.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xg.mapper.AdminMapper;
import com.xg.model.Admin;
import com.xg.model.Page;
import com.xg.service.AdminService;
import com.xg.util.MailUitls;
import com.xg.util.UUIDUtils;

@Transactional
@Service
public class AdminServiceImpl implements AdminService {
	
	@Resource
	private AdminMapper adminMapper;
	
	@Override
	public Admin checkLogin(Admin admin) {
		return adminMapper.checkLogin(admin);
	}
	
	@Override
	public List<Admin> findAllAdmins() {
		return adminMapper.findAllAdmins();
	}
	
	@Override
	public long getAllAdminCount() {
		return adminMapper.getAllAdminCount();
	}
	
	@Override
	public List<Admin> getAdmins(Page page) {
		return adminMapper.getAdmins(page);
	}
	
	@Override
	public void saveAdmin(Admin admin) {
		String aCode = UUIDUtils.getUUID();
		admin.setaCode(aCode);
		adminMapper.saveAdmin(admin);
		MailUitls.sendMail(admin.getaEmail(), aCode);
	}
	
	@Override
	public Admin findAdminByAid(int aId) {
		return adminMapper.findAdminByAid(aId);
	}
	
	@Override
	public void updateAdminByAid(Admin admin) {
		adminMapper.updateAdminByAid(admin);
	}
	
	@Override
	public void deleteAdminByAid(int aId) {
		adminMapper.deleteAdminByAid(aId);
	}

	@Override
	public Admin findByACode(String aCode) {
		return adminMapper.findByACode(aCode);
	}

	@Override
	public Admin findByUsername(String aUserName) {
		return adminMapper.findByUsername(aUserName);
	}

}
