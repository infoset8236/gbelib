package kr.go.gbelib.app.cms.module.delivery;

import kr.co.whalesoft.framework.base.BaseController;
import kr.co.whalesoft.framework.exception.AuthException;
import kr.co.whalesoft.framework.utils.JsonResponse;
import kr.go.gbelib.app.module.delivery.Delivery;
import kr.go.gbelib.app.module.delivery.DeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = {"/cms/module/delivery/"})
public class DeliveryController extends BaseController {

    private final String basePath = "/cms/module/delivery/";

    @Autowired
    private DeliveryService deliveryService;

    @RequestMapping(value = {"/index.*"})
    public String index(Model model, Delivery delivery, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);
        delivery.setHomepage_id(getAsideHomepageId(request));
        deliveryService.setPaging(model, deliveryService.getAllDeliveryListCount(delivery), delivery);
        model.addAttribute("deliveryList", deliveryService.getAllDeliveryList(delivery));
        model.addAttribute("deliveryCount", deliveryService.getAllDeliveryListCount(delivery));

        return basePath + "index";
    }

    @RequestMapping(value = {"/returndelivery.*"})
    public String returnDelivery(Model model, Delivery delivery, HttpServletRequest request) throws AuthException {
        checkAuth("R", model, request);
        delivery.setHomepage_id(getAsideHomepageId(request));
        deliveryService.setPaging(model, deliveryService.getApprovalReturnDeliveryListCount(delivery), delivery);
        model.addAttribute("deliveryList", deliveryService.getApprovalReturnDeliveryList(delivery));
        model.addAttribute("deliveryCount", deliveryService.getApprovalReturnDeliveryListCount(delivery));

        return basePath + "returndelivery";
    }

    @RequestMapping(value = {"/save.*"}, method= RequestMethod.POST)
    public @ResponseBody JsonResponse saveDelivery(Model model, Delivery delivery, BindingResult result, HttpServletRequest request, HttpServletResponse response) throws Exception {
        JsonResponse res = new JsonResponse(request);

        delivery.setHomepage_id(getAsideHomepageId(request));

        if(!result.hasErrors()) {
            if (delivery.getEditMode().equals("APPROVE")) {
                deliveryService.updateDelivery(delivery);
                res.setValid(true);
                res.setMessage("택배 신청을 승인하였습니다.");
            }
            if (delivery.getEditMode().equals("REJECT")) {
                deliveryService.updateDelivery(delivery);
                res.setValid(true);
                res.setMessage("택배 신청을 반려하였습니다.");
            }
            if (delivery.getEditMode().equals("RETURN")) {
                deliveryService.updateReturnDelivery(delivery);
                res.setValid(true);
                res.setMessage("택배 반납이 완료되었습니다.");
            }
        } else {
            res.setValid(false);
            res.setResult(result.getAllErrors());
        }
        return res;
    }
}
