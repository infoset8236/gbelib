package kr.go.gbelib.app.module.delivery;

import kr.co.whalesoft.framework.base.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeliveryService extends BaseService {

    @Autowired
    public DeliveryDao dao;

    public int addDelivery(Delivery delivery) {
        return dao.addDelivery(delivery);
    }

    public List<Delivery> getAllDeliveryList(Delivery delivery) {
        return dao.getAllDeliveryList(delivery);
    }

    public List<Delivery> getDeliveryList(Delivery delivery) {
        return dao.getDeliveryList(delivery);
    }

    public List<Delivery> getReturnDeliveryList(Delivery delivery) {
        return dao.getReturnDeliveryList(delivery);
    }

    public List<Delivery> getApprovalReturnDeliveryList(Delivery delivery) {
        return dao.getApprovalReturnDeliveryList(delivery);
    }

    public int getDuplicateDelivery(Delivery delivery) {
        return dao.getDuplicateDelivery(delivery);
    }

    public int getAllDeliveryListCount(Delivery delivery) {
        return dao.getAllDeliveryListCount(delivery);
    }

    public int getDeliveryListCount(Delivery delivery) {
        return dao.getDeliveryListCount(delivery);
    }

    public int getReturnDeliveryListCount(Delivery delivery) {
        return dao.getReturnDeliveryListCount(delivery);
    }

    public int getApprovalReturnDeliveryListCount(Delivery delivery) {
        return dao.getApprovalReturnDeliveryListCount(delivery);
    }

    public int updateDelivery(Delivery delivery) {
        return dao.updateDelivery(delivery);
    }

    public int updateReturnDelivery(Delivery delivery) {
        int result = 0;
        if(delivery.getDelivery_idx_arr() != null) {
            for(Integer delivery_idx: delivery.getDelivery_idx_arr()) {
                Delivery one = new Delivery();
                one.setDelivery_idx(delivery_idx);
                one.setHomepage_id(delivery.getHomepage_id());
                one.setDelivery_return_status(delivery.getDelivery_return_status());
                result += dao.updateReturnDelivery(one);
            }
        } else {
            result += dao.updateReturnDelivery(delivery);
        }
        return result;
    }

    public int deleteDelivery(Delivery delivery) {
        return dao.deleteDelivery(delivery);
    }
}
