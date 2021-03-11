package icia.oap.services.management;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.json.Jackson2JsonDecoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementModify {

	ModelAndView mav = null;
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	
	
	public ManagementModify() {
		
	}
	

	public ModelAndView entrance(ManageBean mBean) {
		switch(mBean.getSCode()) {
		case "Change":
			mav = this.changeCtl(mBean);
			break;
			
		case "ChangeComplete":
			mav = this.changeComplete(mBean);
			break;
			
		case "Drop":
			mav = this.dropCtl(mBean);
			break;
		}
		
		return mav;
	}
	
	
	private ModelAndView changeCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		// 매장정보 가져오기
		String nameData = gson.toJson(this.selectName(mBean));
		System.out.println(nameData);
		mav.addObject("nameData", nameData);
		
		// 업무타입 가져오기
		String tlComment = gson.toJson(this.selectComment(mBean));
		System.out.println(tlComment);
		mav.addObject("commentData", tlComment);
		
		// mtDetail 가져오기
		String allTaskList = gson.toJson(this.getAllTaskList(mBean));
		System.out.println(allTaskList);
		mav.addObject("allTaskList", allTaskList);
		
		mav.addObject("mtDetail", mBean.getMtDetail());
		
		mav.setViewName("editWork");
		
		return mav;
	}
	
	private ModelAndView changeComplete(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		// update 설정만 해두기
		String changeTaskList = gson.toJson(this.change(mBean));
		mav.addObject("changeTaskList", changeTaskList);
		
		mav.setViewName("editWork");
		
		return mav;
	}
	
	// update 설정만 해두기
	private boolean change(ManageBean mBean) {
		return this.convertToBoolean(mapperM.change(mBean));
	}
	
	// 매장정보 가져오기
	private ArrayList<ManageBean> selectName(ManageBean mBean) {
		return mapperM.getNameData(mBean);
	}
	
	// 업무타입 가져오기
	private ArrayList<ManageBean> selectComment(ManageBean mBean) {
		return mapperM.getCommentData(mBean);
	}
	
	// 매장정보 가져오기
		private ArrayList<ManageBean> getAllTaskList(ManageBean mBean) {
			return mapperM.getAllTaskList(mBean);
		}


	private boolean convertToBoolean(int data) {
		return (data==1)?true:false;
	}
	
	private ModelAndView dropCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		String deleteState;
		
		if(this.drop(mBean)) {
			deleteState = "1";
		}else {
			deleteState = "0";
		}
		System.out.println("deleteState"+deleteState);
		mav.addObject("deleteState", deleteState);
		return mav;
	}
	
	private boolean drop(ManageBean mBean) {
		return this.convertToBoolean(mapperM.drop(mBean));
	}
	
	private ModelAndView deleteScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean deleteSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.deleteSchedule(mBean));
	}
	
}










