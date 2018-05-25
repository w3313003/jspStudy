package SqlTest.Customer.dao;
import SqlTest.Customer.model.Customer;

public interface  CustomerDAO {
    public void insert(Customer customer);
    public Customer findByCustomerId(int custId);
}
