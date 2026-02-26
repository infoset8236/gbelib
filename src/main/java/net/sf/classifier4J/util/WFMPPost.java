package net.sf.classifier4J.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.Socket;
import java.net.URL;

public class WFMPPost
{
  private String wfServerAddress = "";
  private String denyUrl = "";
  private int wfServerPort = 80;
  private String webServerDomain = "";
  private String wfCharset = "utf8";
  private String actionURL = "/fileUpload.do";
  private String linkUrl = "/board/record/list.do";
  
  public WFMPPost(String webServerDomain, String wfServerAddress, int wfServerPort, String wfCharset) {
    this.webServerDomain = webServerDomain;
    this.wfServerAddress = wfServerAddress;
    this.wfServerPort = wfServerPort;
    if ((wfCharset != null) && (!wfCharset.equals(""))) {
      this.wfCharset = wfCharset;
    }
  }
  
  public WFMPPost(String webServerDomain, String wfServerAddress, int wfServerPort, String wfCharset, String actionURL, String linkUrl) {
    this.webServerDomain = webServerDomain;
    this.wfServerAddress = wfServerAddress;
    this.wfServerPort = wfServerPort;
    if ((wfCharset != null) && (!wfCharset.equals(""))) {
      this.wfCharset = wfCharset;
    }
    if ((actionURL != null) && (!actionURL.equals(""))) {
      this.actionURL = actionURL;
    }
    if ((linkUrl != null) && (!linkUrl.equals(""))) {
      this.linkUrl = linkUrl;
    }
  }
  
  public String sendWebFilter(String writer, String subject, String content, String filePath) throws Exception {
    String webfilterResult = "";
    Socket wfs = null;
    boolean denyFlag = false;
    boolean byPass = false;
    String wfServerAddr = "";
    
    try
    {
      wfs = new Socket();
      java.net.SocketAddress remoteAddr = new java.net.InetSocketAddress(wfServerAddress, wfServerPort);
      wfs.connect(remoteAddr, 3000);
    } catch (Exception e) {
      byPass = true;
      
      if (wfs != null) {
        try {
          wfs.close();
        }
        catch (Exception localException1) {}
      }
    }
    finally
    {
      if (wfs != null) {
        try {
          wfs.close();
        }
        catch (Exception localException2) {}
      }
    }
    if (!byPass) {
      try {
        if (wfServerPort == 80) {
          wfServerAddr = wfServerAddress;
        } else {
          wfServerAddr = wfServerAddress + ":" + wfServerPort;
        }
        URL targetURL = new URL("http://" + wfServerAddr + "/webfilterSubmitAction.do?serverDomain_=" + webServerDomain + "&serverPort_=&writeFormName_=fileForm&serverProtocol_=http:&WFcharSet_=" + wfCharset + "&WFOrgAction_=/fileUpload.do&WFlistUrl_=/board/record/list.do");
        HttpURLConnection conn = (HttpURLConnection)targetURL.openConnection();
        
        String delimeter = "------------ei4gL6Ij5ei4GI3Ij5Ij5gL6cH2Ef1";
        
        byte[] newLineBytes = "\r\n".getBytes();
        byte[] delimeterBytes = delimeter.getBytes();
        byte[] dispositionBytes = "Content-Disposition: form-data; name=".getBytes();
        byte[] nameBytes = "file".getBytes();
        byte[] quotationBytes = "\"".getBytes();
        byte[] contentTypeBytes = "Content-Type: application/octet-stream".getBytes();
        byte[] fileNameBytes = "; filename=".getBytes();
        byte[] twoDashBytes = "--".getBytes();
        
        byte[] subjectBytes = "subject".getBytes();
        byte[] contentBytes = "content".getBytes();
        byte[] writerBytes = "writer".getBytes();
        
        byte[] subjectContentBytes = subject.getBytes();
        byte[] contentContentBytes = content.getBytes();
        byte[] writerContentBytes = writer.getBytes();
        
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + delimeter);
        conn.setDoInput(true);
        conn.setDoOutput(true);
        conn.setUseCaches(false);
        
        BufferedOutputStream bos = null;
        try
        {
          bos = new BufferedOutputStream(conn.getOutputStream());

          bos.write(twoDashBytes);
          bos.write(delimeterBytes);
          bos.write(newLineBytes);
          bos.write(dispositionBytes);
          bos.write(quotationBytes);
          bos.write(writerBytes);
          bos.write(quotationBytes);
          bos.write(newLineBytes);
          bos.write(newLineBytes);
          bos.write(writerContentBytes);
          bos.write(newLineBytes);

          bos.write(twoDashBytes);
          bos.write(delimeterBytes);
          bos.write(newLineBytes);
          bos.write(dispositionBytes);
          bos.write(quotationBytes);
          bos.write(subjectBytes);
          bos.write(quotationBytes);
          bos.write(newLineBytes);
          bos.write(newLineBytes);
          bos.write(subjectContentBytes);
          bos.write(newLineBytes);

          bos.write(twoDashBytes);
          bos.write(delimeterBytes);
          bos.write(newLineBytes);
          bos.write(dispositionBytes);
          bos.write(quotationBytes);
          bos.write(contentBytes);
          bos.write(quotationBytes);
          bos.write(newLineBytes);
          bos.write(newLineBytes);
          bos.write(contentContentBytes);
          bos.write(newLineBytes);

          bos.write(twoDashBytes);
          bos.write(delimeterBytes);
          if (filePath.length() > 0) {
            String[] filePathArr = null;
            
            if (filePath.indexOf(",") > -1) {
              filePathArr = filePath.split(",");
              for (int i = 0; i < filePathArr.length; i++) {
                File mFile = new File(filePathArr[i].trim());
                
                if (!badFileExtIsReturnBoolean(mFile.getName())) {
                  bos.write(newLineBytes);
                  bos.write(dispositionBytes);
                  bos.write(quotationBytes);
                  bos.write(nameBytes);
                  bos.write(quotationBytes);
                  bos.write(fileNameBytes);
                  bos.write(quotationBytes);
                  bos.write(mFile.getName().getBytes("utf8"));
                  bos.write(quotationBytes);
                  bos.write(newLineBytes);
                  bos.write(contentTypeBytes);
                  bos.write(newLineBytes);
                  bos.write(newLineBytes);
                  
                  BufferedInputStream bis = new BufferedInputStream(new FileInputStream(mFile));
                  byte[] fileBuffer = new byte['က'];
                  int len = -1;
                  while ((len = bis.read(fileBuffer)) != -1) {
                    bos.write(fileBuffer, 0, len);
                  }
                  bos.write(newLineBytes);
                  bos.write(twoDashBytes);
                  bos.write(delimeterBytes);
                  bis.close();
                }
              }
            }
            else {
              File mFile = new File(filePath);
              
              if (!badFileExtIsReturnBoolean(mFile.getName())) {
                bos.write(newLineBytes);
                bos.write(dispositionBytes);
                bos.write(quotationBytes);
                bos.write(nameBytes);
                bos.write(quotationBytes);
                bos.write(fileNameBytes);
                bos.write(quotationBytes);
                bos.write(mFile.getName().getBytes("utf8"));
                bos.write(quotationBytes);
                bos.write(newLineBytes);
                bos.write(contentTypeBytes);
                bos.write(newLineBytes);
                bos.write(newLineBytes);
                
                BufferedInputStream bis = new BufferedInputStream(new FileInputStream(mFile));
                byte[] fileBuffer = new byte['က'];
                int len = -1;
                while ((len = bis.read(fileBuffer)) != -1) {
                  bos.write(fileBuffer, 0, len);
                }
                bos.write(newLineBytes);
                bos.write(twoDashBytes);
                bos.write(delimeterBytes);
                bis.close();
              }
            }
          }
          

          bos.write(twoDashBytes);
          bos.write(newLineBytes);
          bos.flush();
        }
        catch (Exception localException4) {}finally
        {
          if (bos != null) { bos.close();
          }
        }
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        StringBuffer sb = new StringBuffer();
        int iChar;
        while ((iChar = bis.read()) > -1) {
          sb.append((char)iChar);
        }
        if (sb.toString().indexOf("/getCleanBoardErrorFile") > -1)
        {
          denyUrl = sb.toString();
          denyUrl = denyUrl.substring(denyUrl.indexOf("/getCleanBoardErrorFile"), denyUrl.indexOf("\", \"WebFilter\""));
          denyUrl = ("http://" + wfServerAddress + ":" + wfServerPort + denyUrl);
          denyFlag = true;
        } else {
          denyUrl = null;
        }
      }
      catch (Exception localException5) {}
      

      if (!denyFlag)
      {
        webfilterResult = "N";
      }
      else {
        webfilterResult = "Y";
      }
    }
    else {
      webfilterResult = "B";
      denyUrl = null;
    }
    return webfilterResult;
  }
  
  public static boolean badFileExtIsReturnBoolean(String fileName)
  {
    String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
    String[] BAD_EXTENSION = { "dwg", "avi", "wmv", "mpeg", "mpg", "asf", "mkv", "mka", "tp", "ts", "flv", "mp4", "mov", "k3g", "vob", "skm", "asx", "raw", "ram" };
    
    int len = BAD_EXTENSION.length;
    for (int i = 0; i < len; i++) {
      if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
        return true;
      }
    }
    return false;
  }
  
  public String getDenyURL()
  {
    return denyUrl;
  }
  
  public static void main(String[] args) throws Exception {
    WFMPPost wfsend = new WFMPPost("www.xdrm.co.kr", "220.118.0.15", 80, "utf8");

    String wfResponse = wfsend.sendWebFilter("홍길동", "제목테스트 101111-1111111", "내용테스트 101111-1111111", "D:/gif001.gif,D:/111.doc");
    if (wfResponse.equals("Y")) {
      System.out.println("차단");
      System.out.println(wfsend.getDenyURL()); }
    if (wfResponse.equals("N"))
      System.out.println("등록");
    if (wfResponse.equals("B")) {
      System.out.println("바이패스");
    }
  }
}