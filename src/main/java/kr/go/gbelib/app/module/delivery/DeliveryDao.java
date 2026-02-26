package kr.go.gbelib.app.module.delivery;

import java.util.List;

public interface DeliveryDao {

    public int addDelivery(Delivery delivery);

    public List<Delivery> getAllDeliveryList(Delivery delivery);

    public List<Delivery> getDeliveryList(Delivery delivery);

    public List<Delivery> getReturnDeliveryList(Delivery delivery);

    public List<Delivery> getApprovalReturnDeliveryList(Delivery delivery);

    public int getDuplicateDelivery(Delivery delivery);

    public int getAllDeliveryListCount(Delivery delivery);

    public int getDeliveryListCount(Delivery delivery);

    public int getReturnDeliveryListCount(Delivery delivery);

    public int getApprovalReturnDeliveryListCount(Delivery delivery);

    public int updateDelivery(Delivery delivery);

    public int updateReturnDelivery(Delivery delivery);

    public int deleteDelivery(Delivery delivery);
}
