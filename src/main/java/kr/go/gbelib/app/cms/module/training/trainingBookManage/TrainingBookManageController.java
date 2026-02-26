package kr.go.gbelib.app.cms.module.training.trainingBookManage;

import kr.co.whalesoft.app.cms.homepage.Homepage;
import kr.co.whalesoft.app.cms.menu.Menu;
import kr.co.whalesoft.app.cms.menu.MenuService;
import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.cms.module.training.Training;
import kr.go.gbelib.app.cms.module.training.TrainingService;
import kr.go.gbelib.app.cms.module.training.student2.Student2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2;
import kr.go.gbelib.app.cms.module.training.trainingCode2.TrainingCode2Service;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategory;
import kr.go.gbelib.app.cms.module.trainingCategory.TrainingCategoryService;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroup;
import kr.go.gbelib.app.cms.module.trainingCategory.group.TrainingCategoryGroupService;
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
@RequestMapping(value = "/cms/module/training/trainingBookManage")
public class TrainingBookManageController extends BaseController {

    private final String basePath = "/cms/module/training/trainingBookManage/";

    @Autowired
    private TrainingService trainingService;

    @Autowired
    private TrainingCategoryGroupService categoryGroupService;

    @Autowired
    private TrainingCategoryService categoryService;

    @Autowired
    private TrainingCode2Service trainingCode2Service;

    @Autowired
    private TrainingBookManageService trainingBookManageService;

    @Autowired
    private MenuService menuService;

    @RequestMapping(value = {"/index.*"})
    public String index(Model model, Student2 student, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);
//		if ( !getSessionIsAdmin(request) ) {
        student.setHomepage_id(getAsideHomepageId(request));
//		}
        model.addAttribute("categoryGroupList", categoryGroupService.getCategoryGroupListAll(new TrainingCategoryGroup(student.getHomepage_id(), student.getLarge_category_idx())));
        model.addAttribute("categoryList", categoryService.getCategoryListAll(new TrainingCategory(student.getHomepage_id(), student.getGroup_idx(), student.getLarge_category_idx())));
        Training training = new Training(student.getHomepage_id(), student.getGroup_idx(),student.getCategory_idx());
        training.setLarge_category_idx(student.getLarge_category_idx());
        model.addAttribute("trainingList", trainingService.getTrainingListAll(training));
        model.addAttribute("student", student);

        TrainingCode2 trainingCode2 = new TrainingCode2(1);
        trainingCode2.setTraining_code(15);
        model.addAttribute("trainingLargeCategoryList", trainingCode2Service.getSubcategories(trainingCode2));

        return basePath + "index";
    }

    @RequestMapping(value = {"/student.*"})
    public String student(Model model, TrainingBookManage trainingBookManage, Training training, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);

        if (trainingBookManage.getAttendance_status() == null) {
            trainingBookManage.setAttendance_status("ALL");
        }

        if (trainingBookManage.getSearch_start_date() == null && trainingBookManage.getSearch_end_date() == null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String today = sdf.format(new Date());

            trainingBookManage.setSearch_start_date(today);
            trainingBookManage.setSearch_end_date(today);
        }

        int count = trainingBookManageService.getTrainingBookManageCount(trainingBookManage);
        trainingBookManageService.setPaging(model, count, trainingBookManage);

        training.setHomepage_id(trainingBookManage.getHomepage_id());
        if (trainingBookManage.getTraining_idx() != null) {
            training.setTraining_idx(trainingBookManage.getTraining_idx());
        }

        model.addAttribute("training", trainingService.getTrainingByQr(training));
        model.addAttribute("trainingBookManageCount", count);
        model.addAttribute("trainingBookManageList", trainingBookManageService.getTrainingBookManage(trainingBookManage));

        return basePath + "student_ajax";
    }

    @RequestMapping(value = {"/edit.*"})
    public String edit(Model model, TrainingBookManage trainingBookManage, Training training, HttpServletRequest request) throws AuthException {

        training.setHomepage_id(trainingBookManage.getHomepage_id());
        training.setTraining_idx(trainingBookManage.getTraining_idx());
        model.addAttribute("training", trainingService.getTrainingByQr(training));

        return basePath + "edit_ajax";
    }

    @RequestMapping(value = {"/save.*"}, method = RequestMethod.POST)
    public @ResponseBody JsonResponse save(Model model, TrainingBookManage trainingBookManage, BindingResult result, HttpServletRequest request) {

        JsonResponse res = new JsonResponse(request);

        if(!result.hasErrors()) {
            if("ADD".equals(trainingBookManage.getEditMode())) {
                res.setValid(true);
                res.setMessage("qr생성이 진행됩니다.");

                trainingBookManage.setAdd_id(getSessionMemberId(request));
                try {
                    trainingBookManageService.addTrainingBookManage(trainingBookManage);
                } catch (Exception e) {
                    e.printStackTrace();
                    res.setValid(false);
                    res.setMessage("등록에 실패했습니다.");
                    return res;
                }
            } else if ("QR".equals(trainingBookManage.getEditMode()) || "notQR".equals(trainingBookManage.getEditMode())) {
                if (trainingBookManageService.modifyTrainingStudentByIdx(trainingBookManage) > 0) {
                    res.setValid(true);
                    if ("notQR".equals(trainingBookManage.getEditMode())) {
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

            Training training = new Training();
            training.setHomepage_id(trainingBookManage.getHomepage_id());
            training.setTraining_idx(trainingBookManage.getTraining_idx());
            training.setToken(String.valueOf(System.currentTimeMillis()));
            trainingService.modifyToken(training);
        } else {
            res.setValid(false);
            res.setResult(result.getAllErrors());
        }

        return res;
    }

    @RequestMapping(value = {"/qr.*"})
    public String qr(Model model, TrainingBookManage trainingBookManage, Training training, Menu menu, HttpServletRequest request) {
        Homepage homepage = getSessionHomepageInfo(request);

        training.setHomepage_id(homepage.getHomepage_id());
        training.setTraining_idx(trainingBookManage.getTraining_idx());
        Training oneTraining = trainingService.getTrainingByQr(training);

        menu.setHomepage_id(homepage.getHomepage_id());
        menu.setLink_url("/intro/login/index.do");

        model.addAttribute("qrUrl", "https://gbelib.kr/" + homepage.getContext_path() + "/intro/join/qrCheck.do?menu_idx=" + menuService.getMenuIdxByLinkUrl(menu) + "&training_idx=" + trainingBookManage.getTraining_idx() + "&token=" + oneTraining.getToken() + "&qr_count=" + trainingBookManage.getQr_count());
//         테스트 서버에선 아래로 배포된 상태
//        model.addAttribute("qrUrl", "http://218.48.151.16:8018/" + homepage.getContext_path() + "/intro/join/qrCheck.do?menu_idx=" + menuService.getMenuIdxByLinkUrl(menu) + "&training_idx=" + trainingBookManage.getTraining_idx() + "&token=" + oneTraining.getToken() + "&qr_count=" + trainingBookManage.getQr_count());

        return basePath +  "qr_ajax";
    }

    @RequestMapping(value = { "/excelDownload.*" }, method = RequestMethod.POST)
    public TrainingBookManageSearchView excel(Model model, TrainingBookManage trainingBookManage, HttpServletRequest request, HttpServletResponse response) throws Exception {
        model.addAttribute("trainingBookManageList", trainingBookManageService.getExcelTrainingBookManage(trainingBookManage));

        return new TrainingBookManageSearchView();
    }
}
