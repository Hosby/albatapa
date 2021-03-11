package icia.oap.mapper;

import java.util.ArrayList;

import icia.oap.beans.AlbaBean;

public interface AlbaMapper {
	
	public ArrayList<AlbaBean> getAlbaTaskList(AlbaBean aBean);
	
	public ArrayList<AlbaBean> getAlbaTaskListSelect(AlbaBean aBean);
	
	public ArrayList<AlbaBean> getAlbaShopList(AlbaBean aBean);
	
	public int getAlbaTaskListCount(AlbaBean aBean);
	
	public int getAlbaTaskListSelectCount(AlbaBean aBean);
}
