package com.xg.mapper;

import com.xg.model.Constant;

public interface ConstantMapper {
	public Constant findAllConstants();
	public Constant findConstantByCid(int cId);
	public void updateConstantByCid(Constant constant);
}
