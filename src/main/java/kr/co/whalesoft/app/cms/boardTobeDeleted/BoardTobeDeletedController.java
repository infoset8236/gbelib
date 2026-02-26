package kr.co.whalesoft.app.cms.boardTobeDeleted;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.untactBook.untactBookBlackList.UntactBookBlackList;
import kr.go.gbelib.app.cms.module.untactBook.untactBookReservation.UntactBookReservation;
import kr.go.gbelib.app.intro.search.LibrarySearch;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.whalesoft.app.cms.boardManage.BoardManage;
import kr.co.whalesoft.app.cms.boardManage.BoardManageService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = {"/cms/boardTobeDeleted"})
public class BoardTobeDeletedController extends BaseController {

    private final String basePath = "/cms/boardTobeDeleted/";

    @Autowired
    private BoardTobeDeletedService service;

    @Autowired
    private BoardManageService boardManageService;


    @RequestMapping(value = {"/index.*"}, method = RequestMethod.GET)
    public String index(Model model, BoardTobeDeleted board, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);

        board.setHomepage_id(getAsideHomepageId(request));

        service.setPaging(model, service.getBoardCount(board), board);

        BoardManage boardManage = new BoardManage();
        boardManage.setHomepage_id(board.getHomepage_id());

        model.addAttribute("board", board);
        model.addAttribute("boardList", service.getBoard(board));
        model.addAttribute("boardManageList", boardManageService.getBoardManageAll(boardManage));

        return basePath + "index";
    }

    @RequestMapping (value = {"/deleteBoard.*"}, method = RequestMethod.POST)
    public @ResponseBody JsonResponse deleteBoard(BoardTobeDeleted board, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Throwable {
        JsonResponse res = new JsonResponse(request);

        if (!result.hasErrors()) {
            int delete_result = service.deleteBoard(board);
            int delete_file_result = service.deleteBoardFile(board);

            if (delete_result > 0 && delete_file_result > 0) {
                res.setValid(true);
                res.setMessage("영구삭제에 실패하였습니다. 관리자에게 문의하세요");
            } else {
                res.setValid(false);
                res.setMessage("영구삭제 되었습니다.");
            }
        } else {
            res.setValid(false);
            res.setMessage("영구삭제에 실패하였습니다. 관리자에게 문의하세요");
            res.setResult(result.getAllErrors());
        }
        return res;
    }
}
