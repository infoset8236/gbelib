package kr.go.gbelib.app.intro.bookImage;

public interface BookImageDao {
	public String getImage(String isbn);
	
	public int addImage(String isbn, String image);
}
