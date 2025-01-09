package com.jgeppert.struts2.jquery.showcase.datatables;

import com.jgeppert.struts2.jquery.showcase.model.Customer;
import com.jgeppert.struts2.jquery.showcase.model.CustomerDAO;
import org.apache.struts2.ActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.action.SessionAware;

import java.util.List;
import java.util.Map;

public class DatatablesDelete extends ActionSupport implements SessionAware {

    private static final Log log = LogFactory.getLog(DatatablesDelete.class);

    private Map<String, Object> session;
    private String id;

    public DatatablesDelete() {
    }

    @Override
    public void withSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    @Action(results = {
            @Result(name = SUCCESS, type = "json", params = {"includeProperties", "actionMessages.*",
                    "ignoreHierarchy", "false"}),
            @Result(name = ERROR, type = "json", params = {"includeProperties", "actionErrors.*", "ignoreHierarchy",
                    "false", "statusCode", "500"})})
    public String execute() throws Exception {
        String ret = SUCCESS;
        try {
            List<Customer> list = (List<Customer>) session.get("mylist");
            int removeId = Integer.parseInt(id);
            log.debug("Delete Customer " + removeId);
            Customer customer = CustomerDAO.findById(list, removeId);
            list.remove(customer);
        } catch (Exception e) {
            ret = ERROR;
            this.addActionError("Error while deleting customer : " + e.getMessage());
        }
        return ret;
    }

    public void setId(String id) {
        this.id = id;
    }

}
