package kr.go.gbelib.app.intro.bookDescription;

public interface BookDescriptionDao {
	public String getDescription(String isbn);
	
	public int addDescription(String isbn, String description);
}
