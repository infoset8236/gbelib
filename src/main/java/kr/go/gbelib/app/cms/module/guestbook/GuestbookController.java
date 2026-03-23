package kr.go.gbelib.app.cms.module.guestbook;

import kr.co.whalesoft.app.board.Board;
import kr.co.whalesoft.app.board.BoardService;
import kr.co.whalesoft.framework.base.BaseController;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/cms/module/guestbook")
public class GuestbookController extends BaseController {

    private final String basePath = "/cms/module/guestbook/";

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/index.*")
    public String index(Model model, Board board, HttpServletRequest request, HttpServletResponse response) {
        board.setHomepage_id(getAsideHomepageId(request));

        if (board.getStart_date() == null && board.getEnd_date() == null) {
            board.setStart_date(String.valueOf(LocalDate.now()));
            board.setEnd_date(String.valueOf(LocalDate.now()));
        }

        int count = boardService.getAdminGuestbookListCount(board);
        boardService.setPaging(model, count, board);
        model.addAttribute("guestbookListCount", count);
        model.addAttribute("guestbookList", boardService.getAdminGuestbookList(board));
        return basePath + "index";
    }
}
