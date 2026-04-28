package kr.go.gbelib.app.common.api;

import org.apache.commons.lang.StringUtils;
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

	public static boolean sendSSO(Map<String, Object> param, String mode) {
		HttpURLConnection conn = null;
		BufferedReader in = null;

		long totalStart = System.currentTimeMillis();

		try {
			URL apiUrl = new URL(KSIGN_SSO_API_URL + "/" + mode);

			List<String> paramList = new ArrayList<String>();

			if (param != null) {
				Set<String> keys = param.keySet();

				for (String oneKey : keys) {
					String key = URLEncoder.encode(oneKey, "UTF-8");
					String value = URLEncoder.encode(String.valueOf(param.get(oneKey)), "UTF-8");

					paramList.add(key + "=" + value);
				}
			}

			String body = StringUtils.join(paramList, "&");

			long t0 = System.currentTimeMillis();

			conn = (HttpURLConnection) apiUrl.openConnection();
			conn.setRequestMethod("POST");

			// 일단 원인 찾을 때는 넣는 걸 추천
			conn.setConnectTimeout(3000);
			conn.setReadTimeout(5000);

			conn.setDoOutput(true);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			conn.setRequestProperty("Accept", "application/json");

			long t1 = System.currentTimeMillis();
			log.error("[SSOAPI] open/setup time = " + (t1 - t0) + "ms");

			OutputStream os = conn.getOutputStream();

			long t2 = System.currentTimeMillis();
			log.error("[SSOAPI] getOutputStream time = " + (t2 - t1) + "ms");

			os.write(body.getBytes("UTF-8"));
			os.flush();
			os.close();

			long t3 = System.currentTimeMillis();
			log.error("[SSOAPI] write/close time = " + (t3 - t2) + "ms");

			log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API URL : " + apiUrl);
			log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API PARAM : " + body);

			int responseCode = conn.getResponseCode();

			long t4 = System.currentTimeMillis();
			log.error("[SSOAPI] getResponseCode time = " + (t4 - t3) + "ms");
			log.error("[SSOAPI] responseCode = " + responseCode);

			InputStream is;

			if (responseCode == HttpURLConnection.HTTP_OK) {
				is = conn.getInputStream();
			} else {
				is = conn.getErrorStream();
			}

			StringBuffer response = new StringBuffer();

			if (is != null) {
				in = new BufferedReader(new InputStreamReader(is, "UTF-8"));

				String inputLine;

				long t5 = System.currentTimeMillis();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}

				long t6 = System.currentTimeMillis();
				log.error("[SSOAPI] read body time = " + (t6 - t5) + "ms");
				log.error("[SSOAPI] total time = " + (t6 - totalStart) + "ms");
			} else {
				log.error("[SSOAPI] response stream is null");
				log.error("[SSOAPI] total time = " + (System.currentTimeMillis() - totalStart) + "ms");
			}

			log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API RESPONSE : " + response.toString());

			if (responseCode != HttpURLConnection.HTTP_OK) {
				log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API response ERROR : " + responseCode);
				return false;
			}

			JSONObject jsonObject = new JSONObject(response.toString());

			String objectString = jsonObject.getString("object");

			log.error("[SSOAPI] objectString = " + objectString);

			String result = objectString.substring(
					objectString.indexOf("result:") + 7,
					objectString.indexOf(",", objectString.indexOf("result:"))
			);

			log.error("[SSOAPI] result = " + result);

			return "success".equals(result);

		} catch (Exception e) {
			log.error("@@@@@@@@@@@@@@@@@@ KSIGN SSO API ERROR", e);
			log.error("[SSOAPI] total time when error = " + (System.currentTimeMillis() - totalStart) + "ms");
			return false;

		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (Exception e) {}
			}

			if (conn != null) {
				conn.disconnect();
			}
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
