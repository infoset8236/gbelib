package kr.go.gbelib.app.cms.module.elib.hopeElibBook;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kr.co.whalesoft.app.cms.member.Member;
import kr.co.whalesoft.framework.base.BaseService;
import kr.go.gbelib.app.cms.module.elib.book.Book;
import kr.go.gbelib.app.cms.module.elib.comment.Comment;
import kr.go.gbelib.app.cms.module.elib.comment.CommentDao;
import kr.go.gbelib.app.cms.module.elib.config.Config;
import kr.go.gbelib.app.cms.module.elib.config.ConfigDao;
import kr.go.gbelib.app.cms.module.elib.lending.Lending;
import kr.go.gbelib.app.cms.module.elib.lending.LendingDao;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class HopeElibBookService extends BaseService {

    @Autowired
    private HopeElibBookDao dao;


    public int getBookListCntUpload(HopeElibBook book) {
        return dao.getBookListCntUpload(book);
    }

    public List<HopeElibBook> getBookListUpload(HopeElibBook book) {
        return dao.getBookListUpload(book);
    }

    public List<HopeElibBook> getBookListAll(HopeElibBook book) {
        return dao.getBookListAll(book);
    }


    private String bookString(HopeElibBook book) {
        return String.format("%s,%s,%s,%s,\"%s\"", book.getType(), book.getCom_code(), book.getLibrary_code(), book.getBook_code(), book.getBook_name());
    }

    @Transactional
    public Map<String, String> batchInsertBookList(List<HopeElibBook> bookList, List<String> out, String run_mode) throws IOException {
        List<HopeElibBook> insertList = new ArrayList<HopeElibBook>();
        List<HopeElibBook> updateList = new ArrayList<HopeElibBook>();
        List<String> insertIds = new ArrayList<String>();
        List<String> updateIds = new ArrayList<String>();
        int insertCount = 0;
        int updateCount = 0;
        boolean failed = false;
        Map<String, String> result = new HashMap<String, String>();
        result.put("insertCount", "0");
        result.put("updateCount", "0");
        result.put("deleteCount", "0");
        result.put("approveCount", "0");
        result.put("disapproveCount", "0");
        result.put("notExistCount", "0");
        result.put("insertIds", "없음");
        result.put("updateIds", "없음");
        result.put("deleteIds", "없음");
        result.put("approveIds", "없음");
        result.put("disapproveIds", "없음");
        result.put("notExistIds", "없음");

        for (HopeElibBook book : bookList) {
            if (dao.codeDupCheck(book) > 0) {
                if ("WEB".equals(book.getType())) {
                    if (dao.elearningCodeDupCheck(book) > 0) {
                        book.setBook_idx(dao.getBookIdx(book));
                        updateList.add(book);
                    } else {
                        insertList.add(book);
                    }
                } else if ("ADO".equals(book.getType())) {
                    if (dao.audiobookCodeDupCheck(book) > 0) {
                        book.setBook_idx(dao.getBookIdx(book));
                        updateList.add(book);
                    } else {
                        insertList.add(book);
                    }
                } else {
                    book.setBook_idx(dao.getBookIdx(book));
                    updateList.add(book);
                }
            } else {
                insertList.add(book);
            }
        }

        for (HopeElibBook book : insertList) {
            String type = book.getType();

            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
            } else {
                if (dao.addBook(book) == 0) {
                    out.add("삽입 실패: " + bookString(book));
                    failed = true;
                    throw new RuntimeException();
                }

                if (dao.addBookInfo(book) == 0) {
                    out.add("삽입 실패: " + bookString(book));
                    failed = true;
                    throw new RuntimeException();
                }
            }

            if ("ADO".equals(type)) {
                if (dao.addAudiobook(book) == 0) {
                    out.add("삽입 실패: " + bookString(book));
                    failed = true;
                    continue;
                }
            }

            if ("WEB".equals(type)) {
                if (dao.addElearning(book) == 0) {
                    out.add("삽입 실패: " + bookString(book));
                    failed = true;
                    continue;
                }
            }

            ++insertCount;
            if (book.getBook_idx() > 0) {
                insertIds.add(String.valueOf(book.getBook_idx()));
            }
            out.add("삽입 성공: " + bookString(book));
        }

        for (HopeElibBook book : updateList) {
            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
            }

            if (dao.modifyBook(book) == 0) {
                out.add("수정 실패: " + bookString(book));
                failed = true;
                throw new RuntimeException();
            }

            if (dao.modifyBookInfo(book) == 0) {
                out.add("수정 실패: " + bookString(book));
                failed = true;
                throw new RuntimeException();
            }

            if ("ADO".equals(book.getType())) {
                book.setAudio_idx(dao.getAudioIdx(book));
                if (dao.modifyAudiobook(book) == 0) {
                    out.add("수정 실패: " + bookString(book));
                    failed = true;
                    continue;
                }
            }

            if ("WEB".equals(book.getType())) {
                book.setCourse_idx(dao.getCourseIdx(book));
                if (dao.modifyElearning(book) == 0) {
                    out.add("수정 실패: " + bookString(book));
                    failed = true;
                    continue;
                }
            }

            ++updateCount;
            updateIds.add(String.valueOf(book.getBook_idx()));
            out.add("수정 성공: " + bookString(book));
        }

        if (!StringUtils.equals(run_mode, "DEPLOY")) {
            throw new RuntimeException("테스트 모드");
        }

        if (failed) {
            throw new RuntimeException();
        }

        result.put("insertCount", String.valueOf(insertCount));
        result.put("updateCount", String.valueOf(updateCount));
        result.put("insertIds", StringUtils.join(insertIds, ", "));
        result.put("updateIds", StringUtils.join(updateIds, ", "));

        return result;
    }

    @Transactional
    public Map<String, String> batchDeleteBookList(List<HopeElibBook> bookList, List<String> out, String run_mode) throws IOException {
        List<HopeElibBook> deleteList = new ArrayList<HopeElibBook>();
        List<HopeElibBook> notExistList = new ArrayList<HopeElibBook>();
        List<String> deleteIds = new ArrayList<String>();
        List<String> notExistIds = new ArrayList<String>();
        int deleteCount = 0;
        int notExistCount = 0;
        boolean failed = false;
        Map<String, String> result = new HashMap<String, String>();
        result.put("insertCount", "0");
        result.put("updateCount", "0");
        result.put("deleteCount", "0");
        result.put("approveCount", "0");
        result.put("disapproveCount", "0");
        result.put("notExistCount", "0");
        result.put("insertIds", "없음");
        result.put("updateIds", "없음");
        result.put("deleteIds", "없음");
        result.put("approveIds", "없음");
        result.put("disapproveIds", "없음");
        result.put("notExistIds", "없음");

        for (HopeElibBook book : bookList) {
            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
                deleteList.add(book);
//				}
            } else {
                notExistList.add(book);
            }
        }

        for (HopeElibBook book : deleteList) {
            if (dao.deleteBook(book) == 0) {
            }

            if (dao.deleteBookInfo(book) == 0) {
            }

            if ("ADO".equals(book.getType())) {
                if (dao.deleteAudiobook(book) == 0) {
                }
            }

            if ("WEB".equals(book.getType())) {
                if (dao.deleteElearning(book) == 0) {
                }
            }

            ++deleteCount;
            deleteIds.add(String.valueOf(book.getBook_idx()));
            out.add("삭제 성공: " + bookString(book));
        }

        for (HopeElibBook book : notExistList) {
            ++notExistCount;
            notExistIds.add(String.valueOf(book.getBook_idx()));
            out.add("삭제 자료 없음: " + bookString(book));
        }

        if (!StringUtils.equals(run_mode, "DEPLOY")) {
            throw new RuntimeException("테스트 모드");
        }

        if (failed) {
            throw new RuntimeException();
        }

        result.put("deleteCount", String.valueOf(deleteCount));
        result.put("notExistCount", String.valueOf(notExistCount));
        result.put("deleteIds", StringUtils.join(deleteIds, ", "));
        result.put("notExistIds", StringUtils.join(notExistIds, ", "));

        return result;
    }

    @Transactional
    public Map<String, String> batchApproveBookList(List<HopeElibBook> bookList, List<String> out, String run_mode) throws IOException {
        List<HopeElibBook> approveList = new ArrayList<HopeElibBook>();
        List<HopeElibBook> notExistList = new ArrayList<HopeElibBook>();
        List<String> approveIds = new ArrayList<String>();
        List<String> notExistIds = new ArrayList<String>();
        int approveCount = 0;
        int notExistCount = 0;
        boolean failed = false;
        Map<String, String> result = new HashMap<String, String>();
        result.put("insertCount", "0");
        result.put("updateCount", "0");
        result.put("deleteCount", "0");
        result.put("approveCount", "0");
        result.put("disapproveCount", "0");
        result.put("notExistCount", "0");
        result.put("insertIds", "없음");
        result.put("updateIds", "없음");
        result.put("deleteIds", "없음");
        result.put("approveIds", "없음");
        result.put("disapproveIds", "없음");
        result.put("notExistIds", "없음");

        for (HopeElibBook book : bookList) {
            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
                approveList.add(book);
            } else {
                notExistList.add(book);
            }
        }

        for (HopeElibBook book : approveList) {
            if (dao.approveBook(book) == 0) {
                out.add("승인 실패: " + bookString(book));
                failed = true;
                throw new RuntimeException();
            }

            ++approveCount;
            approveIds.add(String.valueOf(book.getBook_idx()));
            out.add("승인 성공: " + bookString(book));
        }

        for (HopeElibBook book : notExistList) {
            ++notExistCount;
            notExistIds.add(String.valueOf(book.getBook_idx()));
            out.add("승인 자료 없음: " + bookString(book));
        }

        if (!StringUtils.equals(run_mode, "DEPLOY")) {
            throw new RuntimeException("테스트 모드");
        }

        if (failed) {
            throw new RuntimeException();
        }

        result.put("approveCount", String.valueOf(approveCount));
        result.put("notExistCount", String.valueOf(notExistCount));
        result.put("approveIds", StringUtils.join(approveIds, ", "));
        result.put("notExistIds", StringUtils.join(notExistIds, ", "));

        return result;
    }

    @Transactional
    public Map<String, String> batchDisapproveBookList(List<HopeElibBook> bookList, List<String> out, String run_mode) throws IOException {
        List<HopeElibBook> disapproveList = new ArrayList<HopeElibBook>();
        List<HopeElibBook> notExistList = new ArrayList<HopeElibBook>();
        List<String> disapproveIds = new ArrayList<String>();
        List<String> notExistIds = new ArrayList<String>();
        int disapproveCount = 0;
        int notExistCount = 0;
        boolean failed = false;
        Map<String, String> result = new HashMap<String, String>();
        result.put("insertCount", "0");
        result.put("updateCount", "0");
        result.put("deleteCount", "0");
        result.put("approveCount", "0");
        result.put("disapproveCount", "0");
        result.put("notExistCount", "0");
        result.put("insertIds", "없음");
        result.put("updateIds", "없음");
        result.put("deleteIds", "없음");
        result.put("approveIds", "없음");
        result.put("disapproveIds", "없음");
        result.put("notExistIds", "없음");

        for (HopeElibBook book : bookList) {
            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
                disapproveList.add(book);
            } else {
                notExistList.add(book);
            }
        }

        for (HopeElibBook book : disapproveList) {
            if (dao.approveBook(book) == 0) {
                out.add("승인 취소 실패: " + bookString(book));
                failed = true;
                throw new RuntimeException();
            }

            ++disapproveCount;
            disapproveIds.add(String.valueOf(book.getBook_idx()));
            out.add("승인 취소 성공: " + bookString(book));
        }

        for (HopeElibBook book : notExistList) {
            ++notExistCount;
            notExistIds.add(String.valueOf(book.getBook_idx()));
            out.add("승인 취소 자료 없음: " + bookString(book));
        }

        if (!StringUtils.equals(run_mode, "DEPLOY")) {
            throw new RuntimeException("테스트 모드");
        }

        if (failed) {
            throw new RuntimeException();
        }

        result.put("disapproveCount", String.valueOf(disapproveCount));
        result.put("notExistCount", String.valueOf(notExistCount));
        result.put("disapproveIds", StringUtils.join(disapproveIds, ", "));
        result.put("notExistIds", StringUtils.join(notExistIds, ", "));

        return result;
    }

    @Transactional
    public Map<String, Object> batchGetMarcUrlList(List<HopeElibBook> bookList, List<String> out, String run_mode) throws IOException {
        List<HopeElibBook> marcUrlList = new ArrayList<HopeElibBook>();
        List<HopeElibBook> notExistList = new ArrayList<HopeElibBook>();
        List<String> marcUrlIds = new ArrayList<String>();
        List<String> notExistIds = new ArrayList<String>();
        int marcUrlsCount = 0;
        int notExistCount = 0;
        boolean failed = false;
        Map<String, Object> result = new HashMap<String, Object>();
        result.put("insertCount", "0");
        result.put("updateCount", "0");
        result.put("deleteCount", "0");
        result.put("approveCount", "0");
        result.put("disapproveCount", "0");
        result.put("notExistCount", "0");
        result.put("marcUrlsCount", "0");
        result.put("insertIds", "없음");
        result.put("updateIds", "없음");
        result.put("deleteIds", "없음");
        result.put("approveIds", "없음");
        result.put("disapproveIds", "없음");
        result.put("notExistIds", "없음");
        result.put("marcUrlstIds", "없음");

        for (HopeElibBook book : bookList) {
            if (dao.codeDupCheck(book) > 0) {
                book.setBook_idx(dao.getBookIdx(book));
                ++marcUrlsCount;
                marcUrlIds.add(String.valueOf(book.getBook_idx()));
                out.add("마크URL 추출 성공: " + bookString(book));
            } else {
                notExistList.add(book);
                out.add("마크URL 추출 실패: " + bookString(book));
                failed = true;
                throw new RuntimeException("마크URL 추출 실패. 자료가 존재하지 않음.");
            }
        }

        for (HopeElibBook book : notExistList) {
            ++notExistCount;
            notExistIds.add(String.valueOf(book.getBook_idx()));
            out.add("마크URL 추출 자료 없음: " + bookString(book));
        }

        if (failed) {
            throw new RuntimeException();
        }

        result.put("marcUrlsCount", String.valueOf(marcUrlsCount));
        result.put("notExistCount", String.valueOf(notExistCount));
        result.put("marcUrlIds", StringUtils.join(marcUrlIds, ", "));
        result.put("notExistIds", StringUtils.join(notExistIds, ", "));
        result.put("marcUrlList", marcUrlList);

        return result;
    }

    public int approveBook(HopeElibBook book) {
        return dao.approveBook(book);
    }

    public int approveBookAll(HopeElibBook book) {
        return dao.approveBookAll(book);
    }

    public int getBookListCnt(HopeElibBook hopeElibBook) {
        return dao.getBookListCnt(hopeElibBook);
    }

    public void updateApplicationHopeElibBook(HopeElibBook hopeElibBook, Member member) {
        dao.updateApplicationHopeElibBook(hopeElibBook, member);
    }

    public int getDupHopeBookCheck(HopeElibBook hopeElibBook) {
        return dao.getDupHopeBookCheck(hopeElibBook);
    }

    public int getHopeBookApplicationListCnt(HopeElibBook hopeElibBook) {
        return dao.getHopeBookApplicationListCnt(hopeElibBook);
    }

    public List<HopeElibBook> getHopeBookApplicationList(HopeElibBook hopeElibBook) {
        return dao.getHopeBookApplicationList(hopeElibBook);
    }

    public void updateCancelHopeElibBook(HopeElibBook hopeElibBook) {
        dao.updateCancelHopeElibBook(hopeElibBook);
    }

    public int getHopeBookAdminListCnt(HopeElibBook hopeElibBook) {
        return dao.getHopeBookAdminListCnt(hopeElibBook);
    }

    public List<HopeElibBook> getHopeBookAdminList(HopeElibBook hopeElibBook) {
        return dao.getHopeBookAdminList(hopeElibBook);
    }

    public HopeElibBook getHopeElibBookOne(HopeElibBook hopeElibBook) {
        return dao.getHopeElibBookOne(hopeElibBook);
    }

    public void updateApplicationStatusAdmin(HopeElibBook hopeElibBook) {
        dao.updateApplicationStatusAdmin(hopeElibBook);
    }

    @Transactional
    public int addBook(HopeElibBook hopeElibBook) {

        if(dao.codeDupCheck(hopeElibBook) > 0) {
            return 0;
        }

        if(dao.addBook(hopeElibBook) == 0) {
            throw new RuntimeException();
        }

        int result = 0;

        if((result = dao.addBookInfo(hopeElibBook)) == 0) {
            throw new RuntimeException();
        }

        if("ADO".equals(hopeElibBook.getType())) {
            if((result = dao.addAudiobook(hopeElibBook)) == 0) {
                throw new RuntimeException();
            }
        }

        return result;
    }

    @Transactional
    public int modifyBook(HopeElibBook hopeElibBook) {

        if(dao.modifyBookInfo(hopeElibBook) == 0) {
            throw new RuntimeException();
        }

        if("ADO".equals(hopeElibBook.getType())) {
            if(dao.modifyAudiobook(hopeElibBook) == 0) {
                throw new RuntimeException();
            }
        }

        return dao.modifyBook(hopeElibBook);
    }

    @Transactional
    public int deleteBook(HopeElibBook hopeElibBook) {

        // TODO: 대출, 예약 삭제 루틴 추가

        dao.deleteBookInfo(hopeElibBook);
        dao.deleteAudiobook(hopeElibBook);

        return dao.deleteBook(hopeElibBook);
    }


    public int getBookListCmsCnt(HopeElibBook hopeElibBook) {
        return dao.getBookListCmsCnt(hopeElibBook);
    }

    public List<HopeElibBook> getBookListCmsAll(HopeElibBook hopeElibBook) {
        return dao.getBookListCmsAll(hopeElibBook);
    }
}
