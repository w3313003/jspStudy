package Spring;

import Beans.Count;
import HelloworldProgram.Hello;
import HelloworldProgram.hwService;
import Human.Customer;
import Human.People;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Springc {
   public static void main(String... args) {
//       获取bean集合
       ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
//       获取具体的bean
       hwService service = (hwService) context.getBean("hwService");
       Object hw = service.getHelloworld();
       ((Hello) hw).sayHello();
       Count count = (Count) context.getBean("count");
       Customer customer = (Customer) context.getBean("Customer");
       Customer customer1 = (Customer) context.getBean("Customer");
       People people = customer.getPeople();
       people.setAge(3);
       People people1 = customer1.getPeople();
       System.out.println(people);
       System.out.println(people1);

       count.setCount(1321);
       System.out.println(count.getCount());
   }
}
