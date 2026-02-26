package kr.go.gbelib.app.module.useDateInfo;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManage;
import kr.co.whalesoft.app.cms.module.calendarManage.CalendarManageService;
import kr.co.whalesoft.framework.base.BaseController;

@Controller
@RequestMapping(value = {"/{homapagePath}/module/useDateInfo"})
public class UseDateInfoController extends BaseController {
	
	private String basePath = "/homepage/%s/module/useDateInfo/";
	
	@Autowired
	private CalendarManageService calendarManageService;

	@RequestMapping(value = {"/index.*"})
	public String index(Model model, CalendarManage calendarManage, HttpServletRequest request, HttpServletResponse response, String contextPath) throws Exception {
		Homepage homepage = (Homepage) request.getAttribute("homepage");

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM");
		if (StringUtils.isEmpty(calendarManage.getPlan_date())) {
			calendarManage = new CalendarManage(sf.format(Calendar.getInstance().getTime()));
		}
				
		Date time = new Date();
		String yyyymm = sf.format(time);		
		calendarManage.setPlan_date(yyyymm);
		calendarManage.setHomepage_id(homepage.getHomepage_id());		
				
		model.addAttribute("closeDayList", calendarManageService.getClosedDate2(calendarManage));	
		return String.format(basePath, homepage.getFolder()) + "index";
	
	}
	
}
