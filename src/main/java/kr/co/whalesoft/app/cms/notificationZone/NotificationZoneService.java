package kr.co.whalesoft.app.cms.notificationZone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.whalesoft.framework.base.BaseService;

@Service
public class NotificationZoneService extends BaseService {

	@Autowired
	private NotificationZoneDao dao;
	
	public List<NotificationZone> getNotificationZoneList(NotificationZone notificationZone){
		return dao.getNotificationZoneList(notificationZone);
	}
	
	public int getNotificationZoneCount(NotificationZone notificationZone) {
		return dao.getNotificationZoneCount(notificationZone);
	}
	
	public NotificationZone getNotificationZoneOne(NotificationZone notificationZone) {
		return dao.getNotificationZoneOne(notificationZone);
	}
	
	public int addNotificationZone(NotificationZone notificationZone) {
		return dao.addNotificationZone(notificationZone);
	}
	
	public int modifyNotificationZone(NotificationZone notificationZone) {
		return dao.modifyNotificationZone(notificationZone);
	}
	
	public int deleteNotificationZone(NotificationZone notificationZone) {
		return dao.deleteNotificationZone(notificationZone);
	}
	
	public NotificationZone getUsedNotificationZoneOne(NotificationZone notificationZone) {
		return dao.getUsedNotificationZoneOne(notificationZone);
	}
}
