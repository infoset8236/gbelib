package kr.co.whalesoft.framework.exception;

/**
 * 권한 예외처리
 * @author YONGJU
 *
 */
public class AuthException extends Exception {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AuthException() {
		super("권한이 없습니다.\\n관리자에게 문의(권한부여)후 로그인 하시기 바랍니다.");
	}
	
	public AuthException(String message) {
		super(message);
	}

}
