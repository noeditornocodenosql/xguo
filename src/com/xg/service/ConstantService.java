package com.xg.service;

import com.xg.model.Constant;

public interface ConstantService {
	public Constant findAllConstants();
	public Constant findConstantByCid(int cId);
	public void updateConstantByCid(Constant constant);
}
