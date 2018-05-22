package Beans;

import java.util.Arrays;
import java.util.List;

public class t {
    public static void main(String... str) {
        Integer[] arr = {1, 2, 3, 4, 5, 6, 7};
        List<Integer> list = Arrays.asList(arr);
        list.forEach(i -> System.out.println(i));
    }
    private String name = "123";
}