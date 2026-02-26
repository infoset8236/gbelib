package kr.co.whalesoft.app.cms.notificationZone;

import java.util.List;

public interface NotificationZoneDao {
	
	public List<NotificationZone> getNotificationZoneList(NotificationZone notificationZone);
	
	public int getNotificationZoneCount(NotificationZone notificationZone);
	
	public NotificationZone getNotificationZoneOne(NotificationZone notificationZone);
	
	public int addNotificationZone(NotificationZone notificationZone);
	
	public int modifyNotificationZone(NotificationZone notificationZone);
	
	public int deleteNotificationZone(NotificationZone notificationZone);
	
	public NotificationZone getUsedNotificationZoneOne(NotificationZone notificationZone);
}
