package kr.go.gbelib.app.common.api;

import com.google.gson.JsonObject;
import kr.co.whalesoft.framework.utils.PagingUtils;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

public class SSOAPI {
	protected final static Logger log = LoggerFactory.getLogger(SSOAPI.class);
	public final static String KSIGN_SSO_API_URL = "http://172.20.102.216:29091/ksign/authenmanager/api/user";

	public static HttpURLConnection initConn(String urlStr) throws Exception {
		URL url = new URL(urlStr);

		HttpURLConnection connection = null;
		connection = (HttpURLConnection) url.openConnection();
		connection.setRequestProperty("Accept-Charset", "UTF-8");
		connection.setRequestProperty("Accept-Language", "utf-8,ko;q=0.8,en-us;q=0.5,en;q=0.3");
		connection.setDoOutput(true);
		return connection;
	}

	public static boolean sendSSO (Map<String, Object> param, String mode) {
		try {
			URL url = new URL(KSIGN_SSO_API_URL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			List<String> paramList = new ArrayList<String>();
			if (param != null) {
				Set<String> keys = param.keySet();
				for (String oneKey : keys) {
					paramList.add(String.format("%s=%s", oneKey, param.get(oneKey)));
				}
			}

			conn = initConn(url + "/" + mode + "?" + StringUtils.join(paramList, "&"));
			conn.setRequestMethod("POST");

			int responseCode = conn.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}

				log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API : " + url + "/" + mode + "?" + StringUtils.join(paramList, "&"));

				in.close();

				JSONObject jsonObject = new JSONObject(response.toString());

				String objectString = jsonObject.getString("object");

				String result = objectString.substring(objectString.indexOf("result:") + 7, objectString.indexOf(",", objectString.indexOf("result:")));

				if ("success".equals(result)) {
					return true;
				} else {
					return false;
				}

			} else {
                log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API response ERROR : ", responseCode);
				return false;
			}
		} catch (Exception e) {
            log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API ERROR : ", String.valueOf(e));
			return false;
		}
	}

	public static String getSSOInfo (Map<String, Object> param, String mode) {
		String objectString = "";
		try {
			URL url = new URL(KSIGN_SSO_API_URL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			List<String> paramList = new ArrayList<String>();
			if (param != null) {
				Set<String> keys = param.keySet();
				for (String oneKey : keys) {
					paramList.add(String.format("%s=%s", oneKey, param.get(oneKey)));
				}
			}

			conn = initConn(url + "/" + mode + "?" + StringUtils.join(paramList, "&"));
			conn.setRequestMethod("GET");

			int responseCode = conn.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String inputLine;
				StringBuffer response = new StringBuffer();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}

				log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API : " + url + "/" + mode + "?" + StringUtils.join(paramList, "&"));

				in.close();

				JSONObject jsonObject = new JSONObject(response.toString());

				objectString = jsonObject.getString("object");

			} else {
				log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API response ERROR : ", responseCode);
			}
		} catch (Exception e) {
			log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API ERROR : ", String.valueOf(e));
		}

		return objectString;
	}

}
