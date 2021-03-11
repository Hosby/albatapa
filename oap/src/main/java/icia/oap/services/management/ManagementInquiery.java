package icia.oap.services.management;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementInquiery {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private Gson gson;
	
	ModelAndView mav = null;
	
	public ManagementInquiery() {
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		
		switch(mBean.getSCode()) {
		case "Work":
			mav = this.workCtl(mBean);
			break;
		case "WorkType":
			mav = this.WorkTypeCtl(mBean);
			break;
		}
		
		return mav;
	}
	
//-------------------------------------------------------------------------------------------------------
	private ModelAndView workCtl(ManageBean mBean) {
		mav = new ModelAndView();
		
		/* Work Info & Convert to JSON */
		
		// 전체 업무리스트 조회
		String allTaskList = gson.toJson(this.getAllTaskList(mBean));
		System.out.println(allTaskList);
		mav.addObject("allTaskList", allTaskList);
		
		// 총 업무는 n개 입니다. 조회
		System.out.println(this.getCountTask(mBean));
		mav.addObject("countTask", this.getCountTask(mBean));
		
		String selectTaskList = gson.toJson(this.getTlCommentData(mBean));
		mav.addObject("tlCommentData", selectTaskList);
		
		/* View */
		mav.setViewName("work");
		return mav;
	}
	
	private ModelAndView WorkTypeCtl(ManageBean mBean) {
		mav = new ModelAndView();
		
		/* Work Info & Convert to JSON */
		
		// 부분 업무리스트 조회
		
		String selectTaskList = gson.toJson(this.getTlCommentData(mBean));
		System.out.println(selectTaskList);
		mav.addObject("tlCommentData", selectTaskList);
		
		return mav;
	}
	
	
	
	// 안씀
	private ArrayList<ManageBean> getzCode(ManageBean mBean) {
		
		return mapperM.getzCode(mBean);
	}
	
	// 어디 매장 업무리스트 조회
	private ArrayList<ManageBean> getAllTaskList(ManageBean mBean) {
		
		return mapperM.getAllTaskList(mBean);
	}
	
	private ArrayList<ManageBean> getTlCommentData(ManageBean mBean) {
		
		return mapperM.getTlCommentData(mBean);
	
	}
	
	// 어디 매장 알바생 업무리스트 개수(카운트) 조회
	private int getCountTask(ManageBean mBean) {
		
		return mapperM.getCountTask(mBean);
	}
	
	// 최종 update, delete 할 때 쓸것.
	private boolean convertToboolean(int value) {
		return value==1? true : false;
	}
//-------------------------------------------------------------------------------------------------------
	
	// 나의 매장리스트 가져오기
	private ModelAndView workZoneManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	// 나의 매장리스트 가져오기 - mapper
	private ArrayList<ManageBean> getMyWorkZoneList(ManageBean mBean){
		
		return mapperM.getMyWorkZoneList(mBean);
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 ) 
	private ModelAndView albaManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	// 알바생 관리 ( 현재 매장의 알바생 리스트 가져오기 )
	private ArrayList<ManageBean> getAlbaList(ManageBean mBean){
		return mapperM.getAlbaList(mBean);
	}
	
	
	private ModelAndView albaInfoSearch(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaSearch(ManageBean mBean){
		return mapperM.getAlbaSearch(mBean);
	}
	
	private ModelAndView albaInfoDetail(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getAlbaDetailSearch(ManageBean mBean){
		return mapperM.getAlbaDetailSearch(mBean);
	}
	
	private ModelAndView commuteManagementCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getCommuteList(ManageBean mBean){
		return mapperM.getCommuteList(mBean);
	}
	private ModelAndView selectTimeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getTypeCode(ManageBean mBean){
		return mapperM.getTypeCode(mBean);
	}
	
	private ModelAndView payCtl(ManageBean mBean){
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayList(ManageBean mBean){
		return mapperM.getPayList(mBean);
	}
	
	private ModelAndView payDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ManageBean getPayInfo(ManageBean mBean) {
		return mapperM.getPayInfo(mBean);
	}
	
	private ModelAndView paySelectCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getPayDate(ManageBean mBean){
		return mapperM.getPayDate(mBean);
	}
	
	private ModelAndView scheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getScheduleList(ManageBean mBean){
		return mapperM.getScheduleList(mBean);
	}
	
	private ModelAndView logCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> getLogList(ManageBean mBean){
		return mapperM.getLogList(mBean);
	}
	
	private ModelAndView logDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ModelAndView logDetailSelect(ManageBean mBean) {
		return mapperM.logDetailSelect(mBean);
	}
	
	private ModelAndView laborListCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ArrayList<ManageBean> larborList(ManageBean mBean){
		return mapperM.larborList(mBean);
	}
	
	private ModelAndView laborDetailCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private ModelAndView larborDetailSelect(ManageBean mBean) {
		return mapperM.larborDetailSelect(mBean);
	}
	
}












