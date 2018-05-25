package SpringHello;
import HelloworldProgram.Hello;

public class StrutsHello implements Hello {
    private String name;
    public void setName(String name) {
        this.name = name;
    }
    @Override
    public void sayHello() {
        System.out.println("Struts Say" + this.name);
    }
}
