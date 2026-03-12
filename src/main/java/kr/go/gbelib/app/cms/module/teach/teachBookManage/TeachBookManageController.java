package kr.go.gbelib.app.cms.module.teach.teachBookManage;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.category.Category;
import kr.go.gbelib.app.cms.module.category.CategoryService;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroup;
import kr.go.gbelib.app.cms.module.category.group.CategoryGroupService;
import kr.go.gbelib.app.cms.module.teach.Teach;
import kr.go.gbelib.app.cms.module.teach.TeachService;
import kr.go.gbelib.app.cms.module.teach.student.Student;
import kr.go.gbelib.app.cms.module.teach.teachCode2.TeachCode2;
import kr.go.gbelib.app.cms.module.teach.teachCode2.TeachCode2Service;
import kr.go.gbelib.app.cms.module.training.trainingBookQrManage.TrainingBookQrManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/cms/module/teach/teachBookManage")
public class TeachBookManageController extends BaseController {

    private final String basePath = "/cms/module/teach/teachBookManage/";

    @Autowired
    private TeachService teachService;

    @Autowired
    private CategoryGroupService categoryGroupService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private TeachCode2Service teachCode2Service;

    @Autowired
    private TeachBookManageService teachBookManageService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private TrainingBookQrManageService trainingBookQrManageService;

    @RequestMapping(value = {"/index.*"})
    public String index(Model model, Student student, TeachBookManage teachBookManage, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
        student.setHomepage_id(getAsideHomepageId(request));
//		}
        model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupListAll(new CategoryGroup(student.getHomepage_id(), student.getLarge_category_idx())));
        model.addAttribute("categoryList", categoryService.getCategoryListAll(new Category(student.getHomepage_id(), student.getGroup_idx(), student.getLarge_category_idx())));
        Teach teach = new Teach(student.getHomepage_id(), student.getGroup_idx(),student.getCategory_idx());
        teach.setLarge_category_idx(student.getLarge_category_idx());
        teach.setSearch_text(student.getSearch_text());
        model.addAttribute("teachList", teachService.getTeachListAll(teach));
        model.addAttribute("student", student);

        TeachCode2 teachCode2 = new TeachCode2(1);
        teachCode2.setTeach_code(15);
        model.addAttribute("teachLargeCategoryList", teachCode2Service.getSubcategories(teachCode2));

        return basePath + "index";
    }

    @RequestMapping(value = {"/student.*"})
    public String student(Model model, TeachBookManage teachBookManage, Teach teach, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);

        if (teachBookManage.getAttendance_status() == null) {
            teachBookManage.setAttendance_status("ALL");
        }

        if (teachBookManage.getSearch_start_date() == null && teachBookManage.getSearch_end_date() == null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String today = sdf.format(new Date());

            teachBookManage.setSearch_start_date(today);
            teachBookManage.setSearch_end_date(today);
        }

        if (teachBookManage.getTeach_idx() != null) {
            teach.setTeach_idx(teachBookManage.getTeach_idx());
        }

        if (teachBookManage.getHomepage_id() != null) {
            teach.setHomepage_id(teachBookManage.getHomepage_id());
        }

        int count = teachBookManageService.getTeachBookManageCount(teachBookManage);
        teachBookManageService.setPaging(model, count, teachBookManage);

        model.addAttribute("teach", teachService.getTeachByQr(teach));
        model.addAttribute("teachBookManageCount", count);
        model.addAttribute("teachBookManageList", teachBookManageService.getTeachBookManage(teachBookManage));

        return basePath + "student_ajax";
    }

    @RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
    public @ResponseBody JsonResponse save(Model model, TeachBookManage teachBookManage, BindingResult result, HttpServletRequest request) {

        JsonResponse res = new JsonResponse(request);

        if(!result.hasErrors()) {
            if("ADD".equals(teachBookManage.getEditMode())) {
                res.setValid(true);
                res.setMessage("qr생성이 진행됩니다.");

                Teach teach = new Teach();
                teach.setToken(String.valueOf(System.currentTimeMillis()));
                teach.setHomepage_id(teachBookManage.getHomepage_id());
                teach.setTeach_idx(teachBookManage.getTeach_idx());
                teachService.modifyToken(teach);

                teachBookManage.setAdd_id(getSessionMemberId(request));
                try {
                    teachBookManageService.addTeachBookManage(teachBookManage);
                } catch (Exception e) {
                    e.printStackTrace();
                    res.setValid(false);
                    res.setMessage("등록에 실패했습니다.");
                    return res;
                }
            } else if ("QR".equals(teachBookManage.getEditMode()) || "notQR".equals(teachBookManage.getEditMode())) {
                if (teachBookManageService.modifyTeachStudentByIdx(teachBookManage) > 0) {
                    res.setValid(true);
                    if ("notQR".equals(teachBookManage.getEditMode())) {
                        res.setMessage("미출석처리가 완료되었습니다.");
                    } else {
                        res.setMessage("출석처리가 완료되었습니다.");
                    }
                    return res;
                } else {
                    res.setValid(false);
                    res.setMessage("출석처리에 실패했습니다.");
                    return res;
                }
            }
        } else {
            res.setValid(false);
            res.setResult(result.getAllErrors());
        }

        return res;
    }

    @RequestMapping(value = {"/qr.*"})
    public String qr(Model model, TeachBookManage trainingBookManage, Teach teach, Menu menu, HttpServletRequest request) {
        Homepage homepage = getSessionHomepageInfo(request);

        teach.setHomepage_id(homepage.getHomepage_id());
        teach.setTeach_idx(trainingBookManage.getTeach_idx());
        Teach oneTeach = teachService.getTeachByQr(teach);

        menu.setHomepage_id(homepage.getHomepage_id());
        menu.setLink_url("/intro/login/index.do");

        model.addAttribute("qrUrl", "https://gbelib.kr/" + homepage.getContext_path() + "/intro/join/qrCheck.do?menu_idx=" + menuService.getMenuIdxByLinkUrl(menu) + "&teach_idx=" + trainingBookManage.getTeach_idx() + "&token=" + oneTeach.getToken() + "&qr_check_type=TEACH");
//         테스트 서버에선 아래로 배포된 상태
//        model.addAttribute("qrUrl", "http://218.48.151.16:8018/" + homepage.getContext_path() + "/intro/join/qrCheck.do?menu_idx=" + menuService.getMenuIdxByLinkUrl(menu) + "&teach_idx=" + trainingBookManage.getTeach_idx() + "&token=" + oneTeach.getToken() + "&qr_check_type=TEACH");

        return basePath +  "qr_ajax";
    }

    @RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.POST)
    public TeachBookManageSearchView excel(Model model, TeachBookManage teachBookManage, HttpServletRequest request, HttpServletResponse response) throws Exception {
        model.addAttribute("trainingBookManageList", teachBookManageService.getExcelTeachBookManage(teachBookManage));

        return new TeachBookManageSearchView();
    }
}
