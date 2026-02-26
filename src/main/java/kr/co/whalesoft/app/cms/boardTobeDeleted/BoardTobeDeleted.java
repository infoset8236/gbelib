package kr.co.whalesoft.app.cms.boardTobeDeleted;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.boardFile.BoardFile;

import java.util.List;

public class BoardTobeDeleted extends Board {
    @Override
    protected Object clone() throws CloneNotSupportedException{
        return super.clone();
    }

    private String hwp_only = "N";
    private String excel_only = "N";
    private List<BoardFile> boardFileList;

    public BoardTobeDeleted() {}

    public String getHwp_only() {
        return hwp_only;
    }

    public void setHwp_only(String hwp_only) {
        this.hwp_only = hwp_only;
    }

    public String getExcel_only() {
        return excel_only;
    }

    public void setExcel_only(String excel_only) {
        this.excel_only = excel_only;
    }

    public List<BoardFile> getBoardFileList() {
        return boardFileList;
    }

    public void setBoardFileList(List<BoardFile> boardFileList) {
        this.boardFileList = boardFileList;
    }

}
