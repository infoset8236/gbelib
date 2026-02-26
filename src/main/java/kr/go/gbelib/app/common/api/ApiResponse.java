package kr.go.gbelib.app.common.api;

import java.util.Map;

public class ApiResponse { 
	private boolean status;
	private String message;
	private Map<String, String> list;
	
	public ApiResponse() {}
	
	public ApiResponse(boolean status) {
		this.status = status;
	}
	
	public ApiResponse(boolean status, String message) {
		this.setStatus(status);
		this.message = message;
	}
	
	public ApiResponse(boolean status, Map<String, String> list) {
		this.setStatus(status);
		this.list = list;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public boolean getStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Map<String, String> getList() {
		return list;
	}
	public void setList(Map<String, String> list) {
		this.list = list;
	}

	@Override
	public String toString() {
		return "ApiResponse [status=" + status + ", message=" + message + "]";
	}
}
