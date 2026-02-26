package kr.go.gbelib.app.module.pushNotification;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class PushNotificationService extends BaseService {
	
	@Autowired
	private PushNotificationDao dao;
	
	public List<PushNotification> getPushNotificationList(PushNotification pushNotification) {
		return dao.getPushNotificationList(pushNotification);
	}
	
	public int addPushNotification(PushNotification pushNotification) {
		return dao.addPushNotification(pushNotification);
	}
	
	public int deletePushNotification(PushNotification pushNotification) {
		int rtn = 0;
		
		if(pushNotification != null) {
			rtn = dao.deletePushNotification(pushNotification);
		}
		
		return rtn;
	}

}
