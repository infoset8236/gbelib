package kr.co.whalesoft.framework.dataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSourceValidator implements InitializingBean {

    private static final Logger log = LoggerFactory.getLogger(DataSourceValidator.class);

    private DataSource dataSource;
    private String driverClassName;
    private String url;
    private String username;

    @Override
    public void afterPropertiesSet() {
        log.info("=== JDBC DataSource 연결 검증 시작 ===");

        // 1단계: 드라이버 클래스 로드 확인
        if (driverClassName != null) {
            try {
                Class.forName(driverClassName);
                log.info("[OK] JDBC 드라이버 로드 성공: {}", driverClassName);
            } catch (ClassNotFoundException e) {
                log.error("[FAIL] JDBC 드라이버 클래스를 찾을 수 없습니다: {}", driverClassName);
                log.error("       → 드라이버 JAR 파일이 classpath에 없거나 클래스명이 잘못되었습니다.");
                log.error("       → 원인: {}", e.getMessage());
                return; // 드라이버 없으면 이후 검증 의미 없음
            }
        }

        // 2단계: URL 파싱 가능 여부 (드라이버가 URL을 인식하는지)
        if (url != null && driverClassName != null) {
            try {
                Driver driver = DriverManager.getDriver(url);
                log.info("[OK] JDBC URL 형식 인식 성공: {}", maskPassword(url));
                log.info("     → 처리 드라이버: {}", driver.getClass().getName());
            } catch (SQLException e) {
                log.error("[FAIL] JDBC URL 형식이 잘못되었거나 해당 URL을 처리할 드라이버가 없습니다.");
                log.error("       → URL: {}", maskPassword(url));
                log.error("       → 올바른 형식 예시: jdbc:oracle:thin:@host:1521:SID");
                log.error("       → 원인: {}", e.getMessage());
                return;
            }
        }

        // 3단계: 실제 커넥션 획득 시도
        if (dataSource != null) {
            Connection conn = null;
            try {
                long start = System.currentTimeMillis();
                conn = dataSource.getConnection();
                long elapsed = System.currentTimeMillis() - start;

                log.info("[OK] DB 커넥션 획득 성공 ({}ms)", elapsed);
                log.info("     → DB Product : {}", conn.getMetaData().getDatabaseProductName());
                log.info("     → DB Version : {}", conn.getMetaData().getDatabaseProductVersion());
                log.info("     → JDBC URL   : {}", maskPassword(conn.getMetaData().getURL()));
                log.info("     → Username   : {}", conn.getMetaData().getUserName());

            } catch (SQLException e) {
                String sqlState = e.getSQLState();
                int errorCode  = e.getErrorCode();

                log.error("[FAIL] DB 커넥션 획득 실패");
                log.error("       → URL      : {}", maskPassword(url));
                log.error("       → Username : {}", username);
                log.error("       → SQLState : {}", sqlState);
                log.error("       → ErrorCode: {}", errorCode);
                log.error("       → 원인: {}", e.getMessage());

                // SQLState/ErrorCode로 원인 구분
                diagnose(sqlState, errorCode, e);

            } finally {
                if (conn != null) {
                    try { conn.close(); } catch (SQLException ignored) {}
                }
            }
        }

        log.info("=== JDBC DataSource 연결 검증 완료 ===");
    }

    private void diagnose(String sqlState, int errorCode, SQLException e) {
        String msg = e.getMessage() != null ? e.getMessage().toLowerCase() : "";

        if (msg.contains("unknown host") || msg.contains("no route to host")
                || msg.contains("connection refused") || msg.contains("connect timed out")) {
            log.error("       ★ 진단: DB 서버에 도달할 수 없습니다. 호스트/포트를 확인하세요.");

        } else if (msg.contains("invalid username") || msg.contains("invalid password")
                || msg.contains("access denied") || "28000".equals(sqlState)
                || errorCode == 1017 /* ORA-01017 */) {
            log.error("       ★ 진단: 사용자명 또는 비밀번호가 잘못되었습니다.");

        } else if (msg.contains("listener") || msg.contains("tns") || errorCode == 12541
                || errorCode == 12514 /* ORA-12514: TNS listener does not know of service */) {
            log.error("       ★ 진단: JDBC URL의 호스트/포트/SID(서비스명)를 확인하세요.");

        } else if (msg.contains("database") && msg.contains("not found")
                || "3D000".equals(sqlState) /* PostgreSQL: DB does not exist */) {
            log.error("       ★ 진단: 지정한 데이터베이스(스키마)가 존재하지 않습니다.");

        } else if (msg.contains("timeout") || msg.contains("timed out")) {
            log.error("       ★ 진단: 커넥션 타임아웃 — DB 서버 응답 없음 또는 방화벽 차단 가능성.");

        } else {
            log.error("       ★ 진단: 알 수 없는 오류. DBA 또는 네트워크 담당자에게 위 정보를 공유하세요.");
        }
    }

    /** URL 내 password 파라미터 마스킹 */
    private String maskPassword(String url) {
        if (url == null) return null;
        return url.replaceAll("(?i)(password=)[^&;]+", "$1****");
    }

    // Setters
    public void setDataSource(DataSource dataSource) { this.dataSource = dataSource; }
    public void setDriverClassName(String driverClassName) { this.driverClassName = driverClassName; }
    public void setUrl(String url) { this.url = url; }
    public void setUsername(String username) { this.username = username; }
}