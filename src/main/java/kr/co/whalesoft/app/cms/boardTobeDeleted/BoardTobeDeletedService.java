package kr.co.whalesoft.app.cms.boardTobeDeleted;

import kr.co.whalesoft.app.board.boardFile.BoardFile;
import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardTobeDeletedService extends BaseService {

    @Autowired
    private BoardTobeDeletedDao dao;

    public List<BoardTobeDeleted> getBoard(BoardTobeDeleted board) {
        List<BoardTobeDeleted> boardList = dao.getBoard(board);

        for(BoardTobeDeleted board1: boardList) {
            board1.setBoardFileList(getBoardFile(board1.getBoard_idx()));
        }

        return boardList;
    }

    public int getBoardCount(BoardTobeDeleted board) {
        return dao.getBoardCount(board);
    }

    public List<BoardFile> getBoardFile(int board_idx) {
        return dao.getBoardFile(board_idx);
    }

    public int deleteBoard(BoardTobeDeleted board) {
        return dao.deleteBoard(board);
    }

    public int deleteBoardFile(BoardTobeDeleted board) {
        return dao.deleteBoardFile(board);
    }
}
