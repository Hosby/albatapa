package icia.oap.mapper;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import icia.oap.beans.ManageBean;

public interface ManageMapper {

	//    Inquiery
	
	public ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaList(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaSearch(ManageBean mBean);

	public ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean);

	public ArrayList<ManageBean> getCommuteList(ManageBean mBean);

	//-------------------------------------------------------------------------
	public ArrayList<ManageBean> getzCode(ManageBean mBean);
	
	public ArrayList<ManageBean> getAllTaskList(ManageBean mBean); // 클래스 없어서 추가 -> 어디 매장의 업무 리스트 전체 조회
	
	public int getCountTask(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> getNameData(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> getCommentData(ManageBean mBean); // 클래스 설계 없어서 추가
	
	public ArrayList<ManageBean> getTlCommentData(ManageBean mBean); // 클래스 설계 없어서 추가

	//-------------------------------------------------------------------------
	public ArrayList<ManageBean> getTypeCode(ManageBean mBean);

	public ArrayList<ManageBean> getPayList(ManageBean mBean);

	public ManageBean getPayInfo(ManageBean mBean);

	public ArrayList<ManageBean> getPayDate(ManageBean mBean);

	public ArrayList<ManageBean> getScheduleList(ManageBean mBean);

	public ArrayList<ManageBean> getLogList(ManageBean mBean);

	public ModelAndView logDetailSelect(ManageBean mBean);

	public ArrayList<ManageBean> larborList(ManageBean mBean);

	public ModelAndView larborDetailSelect(ManageBean mBean);
	
	
	
	//   Enroll       ( 등록 )

	public int workAdd(ManageBean mBean);// 사용 안했음.

	public int workAddComplete(ManageBean mBean);// 실제로 추가 insert 하는 역활

	public int addSchedule(ManageBean mBean);
	
	
	
	//  Modify   ( 수정 )

	public int change(ManageBean mBean);

	public int drop(ManageBean mBean);

	public int deleteSchedule(ManageBean mBean);


}
