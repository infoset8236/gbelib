package kr.go.gbelib.app.module.pushNotification;

import java.util.List;

public interface PushNotificationDao {

	public List<PushNotification> getPushNotificationList(PushNotification pushNotification);
	
	public int addPushNotification(PushNotification pushNotification);
	
	public int deletePushNotification(PushNotification pushNotification);
	
}
