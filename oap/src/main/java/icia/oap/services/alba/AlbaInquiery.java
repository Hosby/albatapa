package icia.oap.services.alba;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import icia.oap.beans.AlbaBean;
import icia.oap.mapper.AlbaMapper;

@Service
public class AlbaInquiery {
	
	ModelAndView mav = null;
	
	@Autowired
	private AlbaMapper mapperW;
	@Autowired
	private Gson gson;
	
	public AlbaInquiery() {
		
	}
	
	public ModelAndView entrance(AlbaBean aBean) {
		switch(aBean.getSCode()) {
		case "AlbaTaskList":
			mav = this.albaTaskList(aBean);
			break;
		
		case "AlbaTaskListSelect":
			mav = this.albaTaskListSelect(aBean);
			break;
		}
		
		return mav;
	}
	
	private ModelAndView albaTaskList(AlbaBean aBean) {
		mav = new ModelAndView();
		
		/* TaskWork Info & Convert to JSON */
		
		// 전체 업무리스트 조회
		String albaTaskList = gson.toJson(this.getAlbaTaskList(aBean));
		System.out.println(albaTaskList);
		mav.addObject("albaTaskList", albaTaskList);
		
		// 알바가 가진 매장 전체 조회
		String albaShopList = gson.toJson(this.getAlbaShopList(aBean));
		System.out.println(albaShopList);
		mav.addObject("albaShopList", albaShopList);
		
		
		// 알바가 가진 매장 전체 조회
		String albaTaskListCount = gson.toJson(this.getAlbaTaskListCount(aBean));
		System.out.println(albaTaskListCount);
		mav.addObject("albaTaskListCount", albaTaskListCount);
		
		
		mav.setViewName("albaTaskList");
		return mav;
	}
	
	private ModelAndView albaTaskListSelect(AlbaBean aBean) {
		mav = new ModelAndView();
		
		/* TaskWork Info & Convert to JSON */
		
		// 선택한 매장 업무리스트 조회
		String albaTaskListSelect = gson.toJson(this.getAlbaTaskListSelect(aBean));
		System.out.println(albaTaskListSelect);

		
		
		// 선택한 매장의 업무 개수 조회
		String albaTaskListCount = gson.toJson(this.getAlbaTaskListSelectCount(aBean));
		System.out.println(albaTaskListCount);
		// mav.addObject("albaTaskListSelectCount", albaTaskListCount);
		albaTaskListSelect+= "_" + albaTaskListCount;
		mav.addObject("albaTaskListSelect", albaTaskListSelect);
		
		return mav;
	}
	
	private ArrayList<AlbaBean> getAlbaTaskList(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskList(aBean);
	}
	
	private ArrayList<AlbaBean> getAlbaShopList(AlbaBean aBean) {
		
		return mapperW.getAlbaShopList(aBean);
	}
	
	private ArrayList<AlbaBean> getAlbaTaskListSelect(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskListSelect(aBean);
	}
	
	private int getAlbaTaskListCount(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskListCount(aBean);
	}
	
	private int getAlbaTaskListSelectCount(AlbaBean aBean) {
		
		return mapperW.getAlbaTaskListSelectCount(aBean);
	}
	
	

}
