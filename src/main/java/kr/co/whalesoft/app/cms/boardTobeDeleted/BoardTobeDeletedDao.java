package kr.co.whalesoft.app.cms.boardTobeDeleted;

import kr.co.whalesoft.app.board.boardFile.BoardFile;

import java.util.List;

public interface BoardTobeDeletedDao {

	public List<BoardTobeDeleted> getBoard(BoardTobeDeleted board);
	
	public int getBoardCount(BoardTobeDeleted board);
	
	public List<BoardFile> getBoardFile(int board_idx);

	public int deleteBoard(BoardTobeDeleted board);

	public int deleteBoardFile(BoardTobeDeleted board);
}