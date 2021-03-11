package icia.oap.services.management;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.ManageBean;
import icia.oap.mapper.ManageMapper;

@Service
public class ManagementEnroll {
	
	@Autowired
	private ManageMapper mapperM;
	@Autowired
	private PlatformTransactionManager tran;
	@Autowired
	private Gson gson;
	
	
	ModelAndView mav = null;
	
	public ManagementEnroll() {
		
		
	}
	
	public ModelAndView entrance(ManageBean mBean) {
		switch(mBean.getSCode()) {
			case "WorkAdd":
				mav = workAddCtl(mBean);
				break;
				
			case "WorkAddComplete":
				mav = workAddCompleteCtl(mBean);
				break;
		}
		
		return mav;
	}
	
	// 업무 추가 버튼 누르면 작동하는 메소드
	private ModelAndView workAddCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		/* Work Info & Convert to JSON */
		String nameData = gson.toJson(this.selectName(mBean));
		System.out.println(nameData);
		mav.addObject("nameData", nameData);
		
		String tlComment = gson.toJson(this.selectComment(mBean));
		System.out.println(tlComment);
		mav.addObject("commentData", tlComment);
		
		mav.setViewName("addWork");
		return mav;
	}
	
	
	private ArrayList<ManageBean> selectName(ManageBean mBean) {
		return mapperM.getNameData(mBean);
	}
	
	private ArrayList<ManageBean> selectComment(ManageBean mBean) {
		return mapperM.getCommentData(mBean);
	}
	
	// 업무추가하기 >>>> 업무추가하기 버튼은 창만 띄워줌! 잡을 처리하지 않음.
	/*private boolean workAdd(ManageBean mBean) {
		return this.convertToBoolean(mapperM.workAdd(mBean));
	}
	*/
	
	private boolean convertToBoolean(int data) {
		return (data==1)?true : false;
	}
	
	//
	private ModelAndView workAddCompleteCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		mav.addObject("test",this.workAddComplete(mBean));
		return mav;
	}
	// 업무추가 입력후  추가하기 버튼 
	private boolean workAddComplete(ManageBean mBean) {
		
		return this.convertToBoolean(mapperM.workAddComplete(mBean));
	}
	
	private ModelAndView addScheduleCtl(ManageBean mBean) {
		
		mav = new ModelAndView();
		
		return mav;
	}
	
	private boolean addSchedule(ManageBean mBean) {
		return this.convertToBoolean(mapperM.addSchedule(mBean));
	}
	
}













