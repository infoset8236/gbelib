package kr.go.gbelib.app.cms.module.elib.hopeElibBook;

import java.util.List;
import kr.co.whalesoft.app.cms.member.Member;
import kr.go.gbelib.app.cms.module.elib.book.Book;
import org.apache.ibatis.annotations.Param;

public interface HopeElibBookDao {


    public int getBookListCntUpload(HopeElibBook book);

    public List<HopeElibBook> getBookListUpload(HopeElibBook book);

    public List<HopeElibBook> getBookListAll(HopeElibBook book);

    public int codeDupCheck(HopeElibBook book);

    public int elearningCodeDupCheck(HopeElibBook book);

    public int audiobookCodeDupCheck(HopeElibBook book);

    public int addBook(HopeElibBook book);

    public int addBookInfo(HopeElibBook book);

    public int modifyBook(HopeElibBook book);

    public int modifyBookInfo(HopeElibBook book);

    public int deleteBook(HopeElibBook book);

    public int deleteBookInfo(HopeElibBook book);

    public int addAudiobook(HopeElibBook book);

    public int modifyAudiobook(HopeElibBook book);

    public int deleteAudiobook(HopeElibBook book);

    public int addElearning(HopeElibBook book);

    public int modifyElearning(HopeElibBook book);

    public int deleteElearning(HopeElibBook book);

    public Integer getBookIdx(HopeElibBook book);

    public Integer getCourseIdx(HopeElibBook book);

    public Integer getAudioIdx(HopeElibBook book);

    public int approveBook(HopeElibBook book);

    public int approveBookAll(HopeElibBook book);

    int getBookListCnt(HopeElibBook hopeElibBook);

    int getDupHopeBookCheck(HopeElibBook hopeElibBook);

    int getHopeBookApplicationListCnt(HopeElibBook hopeElibBook);

    List<HopeElibBook> getHopeBookApplicationList(HopeElibBook hopeElibBook);

    void updateCancelHopeElibBook(HopeElibBook hopeElibBook);

    int getHopeBookAdminListCnt(HopeElibBook hopeElibBook);

    List<HopeElibBook> getHopeBookAdminList(HopeElibBook hopeElibBook);

    HopeElibBook getHopeElibBookOne(HopeElibBook hopeElibBook);

    void updateApplicationStatusAdmin(HopeElibBook hopeElibBook);

    int getBookListCmsCnt(HopeElibBook hopeElibBook);

    List<HopeElibBook> getBookListCmsAll(HopeElibBook hopeElibBook);

    int getHopeElibBookApplicantCnt(HopeElibBook hopeElibBook);

    List<HopeElibBook> getHopeElibBookApplicantList(HopeElibBook hopeElibBook);

    List<HopeElibBook> getHopeElibBookApplicantRank(HopeElibBook hopeElibBook);

    HopeElibBook getHopeElibBookApplicantCntOne(HopeElibBook hopeElibBook);

    int addHopeElibBookApplicant(@Param("hopeElibBook") HopeElibBook hopeElibBook, @Param("member") Member member);
}
