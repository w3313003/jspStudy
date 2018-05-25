package Beans;

import SqlTest.Customer.dao.CustomerDAO;
import SqlTest.Customer.model.Customer;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    public static void main(String arg[]) {
        ApplicationContext context = new ClassPathXmlApplicationContext("sql.xml");
        CustomerDAO customerDAO = (CustomerDAO) context.getBean("customerDAO");
        Customer customer = new Customer(1, "zj", 231);
        customerDAO.insert(customer);
        Customer customer1 = customerDAO.findByCustomerId(1);
        System.out.println(customer1);
    }
}
