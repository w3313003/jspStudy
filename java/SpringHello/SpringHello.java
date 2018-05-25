package SpringHello;

import HelloworldProgram.Hello;

public class SpringHello implements Hello {
    @Override
    public void sayHello(){
        System.out.println("Springsay: hello, wolrd");
    }
}
